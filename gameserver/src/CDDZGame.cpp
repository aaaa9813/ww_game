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

}

CDDZGame::~CDDZGame() {
	// TODO Auto-generated destructor stub
}

bool CDDZGame::ProHostMsgByStream(unsigned int uid, unsigned char * data, unsigned int len)
{


	return false;
}
bool CDDZGame::Net_Ready(unsigned int uid)
{
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
		GameStart();
	}

	return false;
}

bool CDDZGame::EnterGame(unsigned int uid, unsigned int &nIndex) {
	if (m_Userlist.find(uid) == m_Userlist.end()) {
		CBaseUser * pUser = new CBaseUser();
		pUser->SetId(uid);
		m_Userlist[uid] = pUser;
		nIndex = AllocIndex(uid);

		m_User[nIndex].Uid = uid;

		if (nIndex == -1) {
			return false;
		}
		pUser->SetIndex(nIndex);

	//	SET_TIMER_ONCE(ONTIMER_WAIT_READY);

		return true;
	}

	return false;
}
void CDDZGame::GameStart() {

	int	m_dipai[] = {1,2,3};

	for (int i = 0; i < 3; i++) {

		PT_DDZ_GAME_START_INFO data;

		memcpy(data.dipai, m_dipai, sizeof(int) * 3);
		memcpy(data.pai, m_User[i].pai, sizeof(int) * 17);

		g_Server.SendData((char *) &data, sizeof(data), m_User[i].Uid);
	}

//	SET_TIMER_ONCE(ONTIMER_WAIT_ZHUOZHUANG)
}


void CDDZGame::ChuPai(CPlayer *pUser, int pai[], int len)
{

}

void CDDZGame::PassPai(CPlayer *pUser)
{

}

void CDDZGame::JiaoPai(CPlayer *pUser, int num)
{

}






SDDZPai g_DDZPaiInfo[54];
SDDZPai * GetDDZPaiInfo( int wId )
{
	for( int i = 0; i < 54; i++ )
	{
		if( g_DDZPaiInfo[i].id == wId )
			return &g_DDZPaiInfo[i];
	}
	return NULL;
}
