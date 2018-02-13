/*
 * CNetApp.h
 *
 *  Created on: 2012-10-26
 *      Author: liyan
 */

#ifndef CNETAPP_H_
#define CNETAPP_H_
#include <map>
#include "RakNetTypes.h"
#include<stdlib.h>

#include <string>

#include "CPeer.h"

#include "CTimer.h"
#include "structdefine.h"
#include "packdefine.h"

#include "BitStream.h"

#if 1
const char SERVER_IP[20] = "localhost";
const unsigned short SERVER_PORT = 61000;//(200-202)
const int ROBOT_NUM = 40;
const int ROOM_ID = 100;
const int SERVER_ID=101;//(300-302)
const int GAME_ID = 2;
#else
const char SERVER_IP[20] = "tankweb.bluerox.cn";
const unsigned short SERVER_PORT = 40001; //60050 roomid 3
const int ROBOT_NUM = 10;
const int ROOM_ID = 10;
const int SERVER_ID=42;//(300-302)
const int GAME_ID = 2;
#endif


using namespace std;

enum {


	ON_HEART_JUMP,

	ON_ENTER_GAME,


	ON_READY,

	ON_LEAVE_GAME,

	ON_JIAO_FEN,

	ON_CHU_PAI,




};
const int ON_ENTER_GAME_TIME = 1000;
const int ON_LEAVE_GAME_TIME = 1000;
const int ON_JIAO_FEN_TIME = 1000;
const int ON_CHU_PAI_TIME = 100;
const int ON_HEART_JUMP_TIME = 1000;
const int ON_READY_TIME = 1000;
class CHostInfo {
public:
	unsigned int nHostId;
	unsigned int nMaxNum;
	unsigned int nCurNum;
	unsigned int nMode;
	bool bLock;
	unsigned int nTeamId;
	char szPwd[6];

	CHostInfo(CHostInfo & other) {
		this->nHostId = other.nHostId;
		this->nMaxNum = other.nMaxNum;
		this->nCurNum = other.nCurNum;
		this->nMode = other.nMode;
		this->bLock = other.bLock;
		this->nTeamId = other.nTeamId;
		strcpy(szPwd, other.szPwd);
	}

	CHostInfo() {
		nHostId = 0;
		nMaxNum = 0;
		nCurNum = 0;
		nMode = 0;
		bLock = false;
		nTeamId = 0;
		szPwd[0] = 0;
	}

	void operator =(CHostInfo & other) {
		this->nHostId = other.nHostId;
		this->nMaxNum = other.nMaxNum;
		this->nCurNum = other.nCurNum;
		this->nMode = other.nMode;
		this->bLock = other.bLock;
		this->nTeamId = other.nTeamId;
		strcpy(szPwd, other.szPwd);
	}

};


struct SMJUser
{
	unsigned int nUserId;
	unsigned int nIndex;

};

class CUser {
public:
	CUser();
	~CUser();

	map<unsigned int, CHostInfo *> m_HostList;


	map<unsigned int, CUser *> m_HostUserList;
	bool createProxyPacket(RakNet::BitStream& inBitStream,
			RakNet::BitStream * outBitStream, int nUserIDorAll = -1);

	void SendData(const char * data, const int len, SystemAddress addr);

	void SendData(BitStream * bitStream, SystemAddress addr);

	void SendJiaoFen(unsigned int ZhuangNum);
	void SendChuPai();
	void SendPass();
	void SendDasaizi();
	void SendDasaiziag();
	void SendEntergame(unsigned serverid, unsigned int gameid, unsigned int uid);
	void SendDapai(unsigned int card);
	void SendGangpass();
	void SendGangreq();
	void SendMopai();
	void SendHeartjump();
	void SendReady();
	bool ConnectServer(const char * ip, const unsigned short port);

	void EnterGame(unsigned int nGameId);

	void EnterRoom(unsigned int nRoomId);

	void EnterHost(unsigned int nHostId);

	void CreateHost();

	void LeaveGame();

	void LeaveRoom();

	void LeaveHost();

	bool ProHostMsg(Packet * packet);
	bool ProHostMsgByStream(Packet * packet);
	bool ProHostIngameMsgByStream(Packet * packet);
	bool SendtoOtherbyProxy(const char* pszData, int nDataLen,
			unsigned int UidOrAll);
	void OnTimer(int iTimerID);
	void SetTimer(int iTimeId, unsigned long ulElapse, bool bOnce = true);
	void KillTimer(int iTimeId);

	bool Run();

	void GetChuPai(unsigned int pai[], unsigned int &num);

	void SwapPai(int i, int j);

	void CardSort();
public:

	SMJUser m_mjuser[3];
	unsigned int m_nUserId;
	unsigned int m_nIndex;

	unsigned int m_nBankIndex;
	unsigned int m_nBankId;

	unsigned int m_nCard[20];
	unsigned int m_nCardNum;
	CPeer * m_peer;


	unsigned int m_nTableCard[20];
	unsigned int m_nTableCardNum;
	unsigned int m_nTableCardUid;


	unsigned int m_nCurFen;
	CTimer * m_pTimer;

	SystemAddress m_ServerAddr;

	bool		m_bMaster;//房主
	CHostInfo * m_pHost;
	CHostInfo tmpCreatehost;//创建主机时，临时存放数据，等服务器返回成功后，加入主机列表。
	CHostInfo tmpJoinhost;//tme join host


	int gamenum;

};

class CNetApp {
public:
	CNetApp();

	virtual ~CNetApp();

	int GetCurId();
	int GetCurIdAndInc();
	bool Init();

	bool Run();

	map<unsigned int, CUser *> m_UserList;

	CUser * GetUser(unsigned int nUserId) {
		if (m_UserList.find(nUserId) != m_UserList.end()) {
			return m_UserList[nUserId];
		}
		return NULL;
	}

	bool AddUser(CUser * pUser) {
		if (pUser != NULL) {
			m_UserList[pUser->m_nUserId] = pUser;
			return true;
		}
		return false;
	}


	unsigned int ARRAY_USERID[ROBOT_NUM];
	unsigned int ROBOT_POINTER;

private:
	bool m_bRun;
	int m_CurId;

};
extern CNetApp g_NetApp;
#endif /* CNETAPP_H_ */
