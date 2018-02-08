/*
 * CDDZGame.cpp
 *
 *  Created on: 2017年4月11日
 *      Author: aaaa
 */

#include "CDDZGame.h"

#include "CUser.h"
#include "MessageIdentifiers.h"
#include "structdefine.h"
#include "packdefine.h"

#include "CServer.h"
CDDZGame::CDDZGame() {
	// TODO Auto-generated constructor stub

	for (int i = 0; i < 54; ++i)
		m_iPai[i] = i;
	//m_wPai[i] = 13 * (i % 4) + i / 4;
	//m_wPai[52] = 52;
	//m_wPai[53] = 53;

	m_iDiZhu = -1;
	//m_bFirst = true;
	m_bInGame = false;

	m_iNumOfBomb = 0;
	m_iNumOfRocket = 0;
	m_iChunTianOrFanChun = 1;
}

CDDZGame::~CDDZGame() {
	// TODO Auto-generated destructor stub
}

void CDDZGame::Reset() {
	memset(m_iCurTabPai, 0, sizeof(int) * 20);
	m_iTabPaiNum = 0;
	m_iChuPaiUser = -1;

	//init
	m_iNumOfBomb = 0;
	m_iNumOfRocket = 0;
	m_iChunTianOrFanChun = 1;

	m_iPassCount = 2;

	m_iCurJiaoFen = -1;
	m_bHasDiZhu = false;

	//random
	int num = rand() % 3;
	m_dwCurUser = num;

	m_bInGame = true;

	//洗牌
	Shuffle();

}

void CDDZGame::Shuffle() {
	int index;
	for (int i = 0; i < 54; i++) {
		index = rand() % 54;
		if (index == i)
			continue;
		m_iPai[i] ^= m_iPai[index];
		m_iPai[index] ^= m_iPai[i];
		m_iPai[i] ^= m_iPai[index];
	}

	//勿删

	//====测试用，a,b,c 分别为三家要的牌Ｉｄ，不要的牌用－１，系统自动填充
	/*int a[20] = {6, 19, 32, 7, 20, 33, 5, 18, 8, 21, -1, -1, -1, -1, -1, -1, -1  }, b[20] = { 9, 10, 22, 23, 35, 36, 3, 16, 12, 25, -1, -1, -1, -1, -1, -1, -1 }, c[20] = {};

	 {
	 int i, j;
	 for( int k = 0; k < 17; k ++ )
	 {
	 if( a[k] == -1 )
	 {

	 bool bb;

	 for( j = 0; j < 54; j++ )
	 {
	 bb = false;
	 for( i = 0; i < 17; i ++ )
	 {
	 if( a[i] == m_wPai[j] && a[i] !=-1 || b[i] == m_wPai[j] && b[i] != -1 )
	 {
	 bb = true;
	 break;
	 }
	 }
	 if( !bb )
	 break;
	 }
	 if( !bb )
	 {
	 a[k] = m_wPai[j];
	 }
	 }
	 }
	 for( int k = 0; k < 17; k ++ )
	 {
	 if( b[k] == -1 )
	 {
	 bool bb;
	 for( j = 0; j < 54; j++ )
	 {
	 bb = false;
	 for( i = 0; i < 17; i ++ )
	 {
	 if( a[i] == m_wPai[j] && a[i] !=-1 || b[i] == m_wPai[j] && b[i] != -1 )
	 {
	 bb = true;
	 break;
	 }

	 }
	 if( !bb )
	 break;
	 }
	 if( !bb )
	 {
	 b[k] = m_wPai[j];
	 }
	 }
	 }
	 for( int k = 0; k < 17; k ++ )
	 {

	 bool bb;

	 for( j = 0; j < 54; j++ )
	 {
	 bb = false;
	 for( i = 0; i < 17; i ++ )
	 {
	 if( a[i] == m_wPai[j] && a[i] !=-1 || b[i] == m_wPai[j] && b[i] != -1 || c[i] == m_wPai[j])
	 {
	 bb = true;
	 break;
	 }

	 }

	 if( !bb )
	 break;
	 }
	 if( !bb )
	 {
	 c[k] = m_wPai[j];
	 }

	 }

	 for( int i = 0; i < 17; i++ )
	 {
	 m_wPai[i] = a[i];
	 m_wPai[i+17] = b[i];
	 m_wPai[i+34] = c[i];

	 }
	 }*/

	m_iNext = 0;
	m_iLast = 54;

	memset(m_iCurTabPai, 0, sizeof(int) * 20);
	m_iTabPaiNum = 0;
	m_iChuPaiUser = -1;
}

bool CDDZGame::StartGame() {
	//CBaseTable::StartGame();

#ifdef DDZ_DEBUG

#endif

	Reset();

	//玩家数据初始化
	for (int i = 0; i < 3; ++i) {
		m_pUsers[i]->m_iState = US_INGAME;

		memcpy(m_UserInfo[i].m_wPai, &m_wPai[m_iNext], sizeof(int) * 17);
		m_iNext += 17;

		m_UserInfo[i].m_bIsDiZhu = false;
		m_UserInfo[i].m_wPaiNum = 17;
		m_UserInfo[i].m_iJiaoFen = -1;
		m_UserInfo[i].m_wDaPaiNum = 0;
		m_UserInfo[i].m_iChuPaiNum = 0;
	}

	//data statrt
//	PT_DDZ_GAME_START_INFO data;
//	data.wNum = num;
//	SendToAllUser( &data, sizeof(data) );

	//data1 pai
//	PT_DDZ_PAI_INFO data1;
//	for( int i = 0; i < 3; ++ i )
//	{
//		data1.dwUserId = m_pUsers[i]->m_dwUserId;
//		memcpy( data1.wPai, m_UserInfo[i].m_wPai, sizeof(int) * 17 );
//		g_ServerApp.SendToAgentServer( m_pUsers[i]->m_dwAgentIndex, &data1, sizeof(data1) );
//	}
//
//	for( int i = 0; i < m_iLookerNum; ++ i )
//	{
//		data1.dwUserId = m_pLookers[i]->m_dwUserId;
//		memcpy( data1.wPai, m_UserInfo[m_pLookers[i]->m_pLookAt->m_iChairId].m_wPai, sizeof(int) * 17 );
//		g_ServerApp.SendToAgentServer( m_pUsers[i]->m_dwAgentIndex, &data1, sizeof(data1) );
//	}

	int m_dipai[] = { 1, 2, 3 };

	for (int i = 0; i < 3; i++) {

		PT_DDZ_GAME_START_INFO data;

		memcpy(data.dipai, m_dipai, sizeof(int) * 3);
		memcpy(data.pai, m_User[i].pai, sizeof(int) * 17);

		g_Server.SendData((char *) &data, sizeof(data), m_User[i].Uid);
	}

	if (m_pUsers[m_dwCurUser]->m_bDrop)
		SET_TIMER_ONCE(WAIT_DDZ_JIAOFEN);
	else
	SET_TIMER_ONCE(WAIT_DDZ_JIAOFEN_OFFLINE);

	return true;
}

bool CDDZGame::ProHostMsgByStream(unsigned int uid, unsigned char * data,
		unsigned int len) {

	return false;
}
bool CDDZGame::Net_Ready(unsigned int uid) {
	CBaseUser * pUser = m_Userlist[uid];

	if (!pUser || pUser->GetReady()) {
		return false;
	}

	pUser->SetReady(true);

	bool flag = true;
	for (map<unsigned int, CBaseUser *>::iterator it = m_Userlist.begin();
			it != m_Userlist.end(); it++) {
		if (!it->second->GetReady()) {
			flag = false;
			break;
		}
	}

	if (flag) {
		StartGame();
	}

	return false;
}

bool CDDZGame::EnterGame(unsigned int uid, unsigned int &nIndex) {
	if (m_Userlist.find(uid) == m_Userlist.end()) {
		CBaseUser * pUser = new CBaseUser();
		pUser->SetId(uid);
		m_Userlist[uid] = pUser;
		nIndex = AllocIndex(uid);

		m_UserInfo[nIndex].Uid = uid;

		if (nIndex == -1) {
			return false;
		}
		pUser->SetIndex(nIndex);

		//	SET_TIMER_ONCE(ONTIMER_WAIT_READY);

		return true;
	}

	return false;
}
//void CDDZGame::GameStart() {
//
//	int m_dipai[] = { 1, 2, 3 };
//
//	for (int i = 0; i < 3; i++) {
//
//		PT_DDZ_GAME_START_INFO data;
//
//		memcpy(data.dipai, m_dipai, sizeof(int) * 3);
//		memcpy(data.pai, m_User[i].pai, sizeof(int) * 17);
//
//		g_Server.SendData((char *) &data, sizeof(data), m_User[i].Uid);
//	}
//
////	SET_TIMER_ONCE(ONTIMER_WAIT_ZHUOZHUANG)
//}

void CDDZGame::ChuPai(CPlayer *pUser, int pai[], int len) {

}

void CDDZGame::PassPai(CPlayer *pUser) {

}

void CDDZGame::JiaoPai(CPlayer *pUser, int num) {

}

SDDZPai g_DDZPaiInfo[54];
SDDZPai * GetDDZPaiInfo(int wId) {
	for (int i = 0; i < 54; i++) {
		if (g_DDZPaiInfo[i].id == wId)
			return &g_DDZPaiInfo[i];
	}
	return NULL;
}
