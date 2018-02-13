#include "CBaseGame.h"
#include "CBaseRoom.h"

CBaseGame::CBaseGame()
{

	m_bDestroy = false;
	m_dwRoomId = 0;

	m_bIsCanRejoinGame = true;

	for (int i = 0; i < INDEX_NUM; i++) {
		m_nIndexlist[i] = 0;
	}
}

void CBaseGame::DelRoom(unsigned int dwRoomId )
{
	for( int i = 0; i < m_pRooms.Num(); ++ i )
	{
		if( m_pRooms[i]->GetId() == dwRoomId )
		{
			m_pRooms.Remove( i );
			break;
		}
	}
}
CBaseGame::~CBaseGame()
{

}
bool CBaseGame::GameEnd()
{
	this->m_bDestroy = true;
}
unsigned int CBaseGame::AllocIndex(unsigned int uid) {
	for (int i = 0; i < INDEX_NUM; i++) {
		if (m_nIndexlist[i] == 0) {
			m_nIndexlist[i] = uid;

			return i;
		}
	}

	return -1;
}

