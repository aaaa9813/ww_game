/*
 * CNetApp.cpp
 *
 *  Created on: 2012-10-26
 *      Author: liyan
 */

#include "CNetApp.h"
#include "brTankNetMessages.h"
#include "GetTime.h"
#include "Kbhit.h"
#include "Gets.h"
#include "packdefine.h"
CNetApp g_NetApp;
CNetApp::CNetApp() {
	// TODO Auto-generated constructor stub
	m_bRun = true;

	m_CurId = 0;

}

CNetApp::~CNetApp() {
	// TODO Auto-generated destructor stub
}

int CNetApp::GetCurIdAndInc() {

	return m_CurId++;
}

int CNetApp::GetCurId() {
	return m_CurId;
}

bool CNetApp::Init() {

	srand(time(NULL));
	m_bRun = true;

	for (int i = 0; i < ROBOT_NUM; i++) {
		ARRAY_USERID[i] = 19506 + i;
	}
	CUser * pUser = new CUser;

	pUser->m_nUserId = ARRAY_USERID[ROBOT_POINTER++];
	GetCurIdAndInc();
	//pUser->m_nUserId = 262117 + GetCurIdAndInc();
	//	pUser->m_nUserId = ROBOT_BEGIN_ID + i;
	if (!pUser->ConnectServer(SERVER_IP, SERVER_PORT)) {
		printf("connect server fail, %d\n", pUser->m_nUserId);
		return false;
	}

	AddUser(pUser);
	//}

	return true;

}

bool CNetApp::Run() {
	while (true) {
		for (map<unsigned int, CUser *>::iterator it = m_UserList.begin();
				it != m_UserList.end(); it++) {
			it->second->Run();
		}

		usleep(100000);

		char message[100];

		if (kbhit()) {
			// Notice what is not here: something to keep our network running.  It's
			// fine to block on gets or anything we want
			// Because the network engine was painstakingly written using threads.
			Gets(message, sizeof(message));
			if (strcmp(message, "quit") == 0) {

				puts("Quitting.");
				break;
			}
		}

		//printf("==========================\n");
	}

	return true;
}

//UidOrAll -1 send msg to all
bool CUser::SendtoOtherbyProxy(const char* pszData, int nDataLen,
		unsigned int UidOrAll) {
	RakNet::BitStream inPacket;
	inPacket.Write(pszData, nDataLen);

	RakNet::BitStream newbitStream;
	if (createProxyPacket(inPacket, &newbitStream, -1)) {
		SendData(&newbitStream, m_ServerAddr);

	}
	//delete newbitStream;

	return true;
}

bool CUser::createProxyPacket(RakNet::BitStream& inBitStream,
		RakNet::BitStream * outBitStream, int nUserIDorAll) {
	int nSendNums;
	if (nUserIDorAll > 0)
		nSendNums = 1;
	else
		nSendNums = m_HostUserList.size();

	if (nSendNums == 0)
		return false;

	outBitStream->Write((unsigned char) PT_SERVER_PROXY);
	outBitStream->Write((unsigned int) nSendNums);

	if (nUserIDorAll > 0) {
		outBitStream->Write((unsigned int) nUserIDorAll); //  写入userID

	} else {
		for (map<unsigned int, CUser *>::iterator it = m_HostUserList.begin();
				it != m_HostUserList.end(); ++it) {
			outBitStream->Write((unsigned int) it->first); //  写入userID
		}

	}

	//int length = inBitStream->GetNumberOfBitsUsed();
	outBitStream->Write(inBitStream);

	return true;
}

CUser::CUser() {
	m_peer = new CPeer(0, false);
	m_pTimer = new CTimer();

	m_bMaster = false;
	m_nIndex = -1;
	m_pHost = NULL;

	SMJUser m_mjuser[4];

	for (int i = 0; i < 4; i++) {
		m_mjuser[i].nIndex = -1;
		m_mjuser[i].nUserId = -1;
	}
	m_nUserId = -1;
	m_nIndex = -1;

	m_nBankIndex = -1;
	m_nBankId = -1;

	m_nCurFen = 0;

	memset(m_nCard, 0, sizeof(unsigned int) * 20);
	m_nCardNum = 0;
}
CUser::~CUser() {
	delete m_peer;
	m_peer = NULL;

	delete m_pTimer;
	m_pTimer = NULL;
}
void CUser::SendData(const char * data, const int len, SystemAddress addr) {
	m_peer->Send(data, len, IMMEDIATE_PRIORITY, RELIABLE_ORDERED, addr);
}

void CUser::SendData(BitStream * bitStream, SystemAddress addr) {
	m_peer->Send(bitStream, IMMEDIATE_PRIORITY, RELIABLE_ORDERED, addr, false);
}

//==========================================================================
void CUser::SendJiaoFen(unsigned int fennum) {
	RakNet::BitStream bsData;
	bsData.Write((unsigned char) PT_HOST_MESSAGE);
	bsData.Write((unsigned int) PT_DDZ_JIAOFEN);

	PT_DDZ_JIAOFEN_INFO data;
	data.nFen = fennum;
	bsData.Write((char *) &data, sizeof(data));
	SendData(&bsData, m_ServerAddr);
}

/**
 *  根据桌面的牌，确定要出的牌
 *  服务器出牌成功后，再更新手牌
 */
void CUser::GetChuPai(unsigned int pai[], unsigned int &num) {
	pai[0] = m_nCard[0];
	num = 1;
}

void CUser::SendChuPai() {
	RakNet::BitStream bsData;
	bsData.Write((unsigned char) PT_HOST_MESSAGE);
	bsData.Write((unsigned int) PT_DDZ_CHUPAI);

	PT_DDZ_CHUPAI_INFO data;
	data.uid = this->m_nUserId;
	GetChuPai(data.pai, data.painum);

	bsData.Write((char *) &data, sizeof(data));
	SendData(&bsData, m_ServerAddr);
}

void CUser::SendDasaizi() {
	RakNet::BitStream bsData;
	bsData.Write((unsigned char) PT_HOST_MESSAGE);
	bsData.Write((unsigned int) PT_MJ_DASAIZI_REQ);
	SendData(&bsData, m_ServerAddr);
}

void CUser::SendDasaiziag() {
	RakNet::BitStream bsData;
	bsData.Write((unsigned char) PT_HOST_MESSAGE);
	bsData.Write((unsigned int) PT_MJ_DASAIZI_AG_REQ);
	SendData(&bsData, m_ServerAddr);
}

void CUser::SendDapai(unsigned int card) {
	RakNet::BitStream bsData;
	bsData.Write((unsigned char) PT_HOST_MESSAGE);
	bsData.Write((unsigned int) PT_MJ_DAPAI_REQ);
	bsData.Write((unsigned int) card);
	SendData(&bsData, m_ServerAddr);
}
void CUser::SendGangpass() {
	RakNet::BitStream bsData;
	bsData.Write((unsigned char) PT_HOST_MESSAGE);
	bsData.Write((unsigned int) PT_MJ_PENG_PASS_REQ);
	SendData(&bsData, m_ServerAddr);
}

void CUser::SendGangreq() {
	RakNet::BitStream bsData;
	bsData.Write((unsigned char) PT_HOST_MESSAGE);
	bsData.Write((unsigned int) PT_MJ_GANG_PASS_REQ);
	SendData(&bsData, m_ServerAddr);
}
void CUser::SendMopai() {
	RakNet::BitStream bsData;
	bsData.Write((unsigned char) PT_HOST_MESSAGE);
	bsData.Write((unsigned int) PT_MJ_MOPAI_REQ);
	SendData(&bsData, m_ServerAddr);
}
void CUser::SendHeartjump() {
	RakNet::BitStream bsData;
	bsData.Write((unsigned char) PT_USER_HEART_JUMP);
	SendData(&bsData, m_ServerAddr);
}
void CUser::SendReady() {

	RakNet::BitStream bsData;
	bsData.Write((unsigned char) PT_HOST_MESSAGE);
	bsData.Write((unsigned int) PT_HOST_READY_REQUEST);
	SendData(&bsData, m_ServerAddr);
}
void CUser::SendEntergame(unsigned serverid, unsigned int gameid,
		unsigned int uid) {
	RakNet::BitStream ws;
	ws.Write((unsigned char) PT_ENTER_GAME_REQUEST);

	PT_ENTER_GAME_REQUEST_INFO_EX1 data;
	data.serverid = serverid;
	data.gameid = gameid;
	data.uid = uid;

	ws.Write((char *) &data, sizeof(data));

//	ws.Write((unsigned int) serverid);
//	ws.Write((unsigned int) gameid);
//	ws.Write((unsigned int) uid);
//	ws.Write((unsigned long long) 0);
	SendData(&ws, m_ServerAddr);
}
//==========================================================================================
bool CUser::ConnectServer(const char * ip, const unsigned short port) {
	int err = m_peer->Connect(ip, port, "", 0);
	if (0 != err)
		printf("the serve error code is: %d\n", err);

	return (0 == err);
}

void CUser::EnterGame(unsigned int nGameId) {

}

void CUser::EnterRoom(unsigned int nRoomId) {

}

void CUser::EnterHost(unsigned int nHostId) {

}

void CUser::CreateHost() {

}

void CUser::LeaveGame() {

}

void CUser::LeaveRoom() {

}

void CUser::LeaveHost() {

}
void CUser::OnTimer(int iTimerID) {

	switch (iTimerID) {

	case ON_ENTER_GAME: {
		printf("enter game request!\n");

//		RakNet::BitStream ws;
//		ws.Write((unsigned char) PT_ENTER_GAME_REQUEST);
//		ws.Write((unsigned int) SERVER_ID);
//		ws.Write((unsigned int) GAME_ID);
//		ws.Write((unsigned int) m_nUserId);
//		ws.Write((unsigned long long) 0);
//		SendData(&ws, m_ServerAddr);

		SendEntergame(SERVER_ID, GAME_ID, m_nUserId);

		printf("ontime===ON_ENTER_GAME_TIME===uid:%d\n", m_nUserId);

	}
		break;

	case ON_JIAO_FEN: {
		SendJiaoFen((m_nCurFen + 1) % 3);

	}
		break;
	case ON_CHU_PAI: {

		if (m_nTableCardNum >= 1) {

			SendChuPai();
		} else {

			SendChuPai();
		}
	}
		break;

	case ON_LEAVE_GAME_TIME: {
		printf("leave game request!\n");

		PT_LEAVE_GAME_REQUEST_INFO data;
		SendData((char *) &data, sizeof(data), m_ServerAddr);
	}
		break;

	case ON_HEART_JUMP: {

//		RakNet::BitStream bsData;
//		bsData.Write((unsigned char) PT_USER_HEART_JUMP);
//		SendData(&bsData, m_ServerAddr);

		SendHeartjump();
	}
		break;

	case ON_READY: {
//		RakNet::BitStream bsData;
//		bsData.Write((unsigned char) PT_HOST_MESSAGE);
//		bsData.Write((unsigned int) PT_HOST_READY_REQUEST);
//		SendData(&bsData, m_ServerAddr);

		SendReady();

		printf("ontimer====ready==uid:%d\n", m_nUserId);
	}
		break;

		if (iTimerID != 15) { //跳过心跳消息
			printf("myself:%d, ONTIME:%d\n", m_nUserId, iTimerID);
		}

	}
}
void CUser::SetTimer(int iTimeId, unsigned long ulElapse, bool bOnce) {
	m_pTimer->SetTimer(iTimeId, ulElapse, bOnce);
}
void CUser::KillTimer(int iTimeId) {
	m_pTimer->KillTimer(iTimeId);
}
bool CUser::ProHostMsg(Packet * packet) {

	return false;
}

void CUser::SwapPai(int i, int j) {
	m_nCard[j] ^= m_nCard[i];
	m_nCard[i] ^= m_nCard[j];
	m_nCard[j] ^= m_nCard[i];
}
/**
 * 出过的牌由于被置为0，所以永远会在最后
 */
void CUser::CardSort() {
	int k = 0;
	for (int i = 0; i < m_nCardNum - 1; i++) {
		k = i;
		for (int j = i; j < m_nCardNum; j++) {
			if (m_nCard[k] < m_nCard[j]) {
				k = j;
			}
		}

		if (k != i) {

			SwapPai(k, i);
		}
	}

	printf("==================================\nuid:%u", this->m_nUserId);
	for (int i = 0; i < m_nCardNum; i++) {
		printf(",%u ", m_nCard[i]);

	}
	printf("==============================\n");
}

bool CUser::ProHostMsgByStream(Packet * packet) {

	unsigned int msgid = *((unsigned int *) (packet->data + 1));

	switch (msgid) {
	case PT_DDZ_MATCH_ACCEPT: {

		printf("PT_DDZ_MATCH_ACCEPT, uid:%u\n", this->m_nUserId);

		unsigned int uid;
		unsigned int nIndex;

		unsigned int num;

		PT_DDZ_MATCH_ACCEPT_INFO * msg =
				(PT_DDZ_MATCH_ACCEPT_INFO *) packet->data;

		num = msg->usernum;
		for (int i = 0; i < num; i++) {

			int nIndex = msg->userindex[i].index;
			int nUid = msg->userindex[i].uid;

			m_mjuser[nIndex].nIndex = nIndex;
			m_mjuser[nIndex].nUserId = nUid;

			if (msg->userindex[i].uid == m_nUserId) {
				m_nIndex = nIndex;
			}

		}

		printf("=============================\n");

		SetTimer(ON_READY, ON_READY_TIME);
	}
		return true;

	case PT_DDZ_DZPAI: {

		printf("PT_DDZ_DZPAI, uid:%u\n", this->m_nUserId);

		PT_DDZ_DZPAI_INFO * msg = (PT_DDZ_DZPAI_INFO *) packet->data;

		if (msg->dwUserId == this->m_nUserId) {
			memcpy(&m_nCard[17], msg->wPai, sizeof(unsigned int) * 3);
			m_nCardNum = 20;

			CardSort();

			SetTimer(ON_CHU_PAI, ON_CHU_PAI_TIME);
		}
	}
		break;

	case PT_DDZ_USER_CHUPAI: {

		printf("PT_DDZ_USER_CHUPAI, uid:%u\n", this->m_nUserId);

		PT_DDZ_USER_CHUPAI_INFO * msg = (PT_DDZ_USER_CHUPAI_INFO *) packet->data;

		//自己出的牌
		if (msg->nUid == this->m_nUserId) {
			//更新手牌
			for (int i = 0; i < msg->nNum; i++) {
				if (this->m_nCard[i] == msg->nPai[i]) {

					//1,1,1,1,1,1,1,0,0,0,0,0
					//与最后一张交换位置，使最后的牌都是用过的
					SwapPai(i, this->m_nCardNum - 1);

					this->m_nCardNum--;
				}
			}

			CardSort();

		} else {
			//别人出的牌
		}

		//轮到自己出牌
		if (msg->nActUid == this->m_nUserId) {
			SetTimer(ON_CHU_PAI, ON_CHU_PAI_TIME);
		}
	}
		break;
	case PT_DDZ_USER_JIAOFEN: {
		printf("PT_DDZ_USER_JIAOFEN, uid:%u\n", this->m_nUserId);
	}
		break;
	case PT_DDZ_USER_PASS: {
		printf("PT_DDZ_USER_PASS, uid:%u\n", this->m_nUserId);
	}
		break;

	case PT_DDZ_GAME_START: {

		printf("PT_DDZ_GAME_START, uid:%u\n", this->m_nUserId);
		PT_DDZ_GAME_START_INFO * msg = (PT_DDZ_GAME_START_INFO *) packet->data;

		memcpy(m_nCard, msg->pai, sizeof(signed int) * 17);
		m_nCardNum = 17;

		CardSort();

		if (msg->nActUid == this->m_nUserId) {
			SetTimer(ON_JIAO_FEN, ON_JIAO_FEN_TIME);
		}
	}
		break;

	case PT_DDZ_USER_JIAOPAI: {

		printf("PT_DDZ_USER_JIAOPAI, uid:%u\n", this->m_nUserId);

		PT_DDZ_USER_JIAOPAI_INFO * msg =
				(PT_DDZ_USER_JIAOPAI_INFO *) packet->data;

		m_nCurFen = msg->nNum;
		if (msg->nActUid == this->m_nUserId) {
			if (msg->nNum < 3) {

				SetTimer(ON_JIAO_FEN, ON_JIAO_FEN_TIME);

			} else {

			}
		}

		int a = 0;
	}
		break;
	case PT_DDZ_GAME_END: {

		printf("PT_DDZ_GAME_END, uid:%u\n", this->m_nUserId);

	}
		break;
	case PT_DDZ_BALANCE: {
		printf("PT_DDZ_BALANCE, uid:%u\n", this->m_nUserId);
	}
		break;

	}

	return false;
}
bool CUser::Run() {

	int iTimerId = m_pTimer->OnTimer();
	if (iTimerId != -1)
		OnTimer(iTimerId);

	unsigned char packetIdentifier;
	for (Packet * packet = m_peer->Receive(); packet;
			m_peer->DeallocatePacket(packet), packet = m_peer->Receive()) {

		packetIdentifier = CPeer::GetPacketIdentifier(packet);
		switch (packetIdentifier/*packet->data[0]*/) {
		case ID_REMOTE_DISCONNECTION_NOTIFICATION:
			printf("Another client has dised.\n");
			break;
		case ID_REMOTE_CONNECTION_LOST:
			printf("Another client has lost the connection.\n");
			break;
		case ID_REMOTE_NEW_INCOMING_CONNECTION:
			printf("Another client has connected.\n");

			break;
		case ID_NEW_INCOMING_CONNECTION: {
			printf("A connection is incoming.\n");

		}
			break;

		case ID_NO_FREE_INCOMING_CONNECTIONS: {
			printf("The server is full.\n");
			break;
		}
		case ID_DISCONNECTION_NOTIFICATION: {
			printf("ID_DISCONNECTION_NOTIFICATION.\n");
		}
			break;

		case ID_CONNECTION_LOST: {
			printf("ID_CONNECTION_LOST.\n");
		}
			break;

		case ID_CONNECTION_REQUEST_ACCEPTED: {
			printf("Our connection request has been accepted.\n");

			m_ServerAddr = packet->systemAddress;

			SetTimer(ON_ENTER_GAME, ON_ENTER_GAME_TIME);

			SetTimer(ON_HEART_JUMP, ON_HEART_JUMP_TIME, false);

			if (g_NetApp.GetCurIdAndInc() >= ROBOT_NUM)
				break;

			CUser * pUser = new CUser;

			pUser->m_nUserId = g_NetApp.ARRAY_USERID[g_NetApp.ROBOT_POINTER++];
//			pUser->m_nUserId = g_NetApp.getBeginId()

			if (!pUser->ConnectServer(SERVER_IP, SERVER_PORT)) {
				printf("connect server fail, %d\n", pUser->m_nUserId);
				break;
			} else {
				printf("connect server success, %d\n", pUser->m_nUserId);
			}
			g_NetApp.AddUser(pUser);

		}
			break;

		case PT_ENTER_GAME_ACCEPT: {
			printf("%d,PT_ENTER_GAME_ACCEPT\n", m_nUserId);

		}

			break;
		case PT_HOST_MESSAGE: {

			if (ProHostMsg(packet))
				break;

			if (ProHostMsgByStream(packet))
				break;

		}
			break;

		case PT_LEAVE_GAME_ACCEPT: {
			printf("myself:%d,PT_LEAVE_GAME_ACCEPT\n", m_nUserId);

			SetTimer(ON_ENTER_GAME_TIME, 1000 + random() % 1000);
		}
			break;
		case PT_LEAVE_ROOM_ACCEPT: {

			printf("myself:%d,PT_LEAVE_ROOM_ACCEPT\n", m_nUserId);

			if (m_pHost)	//自己所在的主机内，有人离开
			{
				for (map<unsigned int, CUser *>::iterator it =
						m_HostUserList.begin(); it != m_HostUserList.end();
						it++) {
					CUser *p = it->second;
					delete p;
					p = NULL;
				}

				m_HostUserList.clear();

				m_pHost = NULL;
			}

			for (map<unsigned int, CHostInfo *>::iterator it =
					m_HostList.begin(); it != m_HostList.end(); it++) {
				delete it->second;
				it->second = NULL;
			}
			m_HostList.clear();

		}
			break;

		default: {
			printf("unknow msg id %d\n", packetIdentifier);
		}
			break;
		}
	}

	return true;
}
