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
//const char SERVER_IP[20] = "35.196.108.73";
const char SERVER_IP[20] = "localhost";
const unsigned short SERVER_PORT = 61000;//(200-202)
const int ROBOT_NUM = 2;
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
enum DDZ_PAI_TYPE
{
	PAI_TYPE_NONE,
	PAI_TYPE_ROCKET,
	PAI_TYPE_BOMB,
	PAI_TYPE_DANSHUN,
	PAI_TYPE_SHUANGSHUN,
	PAI_TYPE_SANSHUN,
	PAI_TYPE_SANDAIYISINGLE,
	PAI_TYPE_SANDAIYIDOUBLE,
	PAI_TYPE_PLANESINGLE,
	PAI_TYPE_PLANEDOUBLE,
	PAI_TYPE_SIDAIERSINGLE,
	PAI_TYPE_SIDAIERDOUBLE,
	PAI_TYPE_THREE,
	PAI_TYPE_DOUBLE,
	PAI_TYPE_SINGLE,
};
struct SDDZPai
{
	int id;
	int value;
	int num;
	int type;

	SDDZPai * operator = ( SDDZPai * pCard )
	{
		this->id	= pCard->id;
		this->value = pCard->value;
		this->num	= pCard->num;
		this->type	= pCard->type;

		return this;
	}
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


	int CheckPaiType(unsigned int pai[], int num);


	int CheckPaiType( SDDZPai pai[], int num, int &PaiSize );

	// 检测是否为火箭牌型
	bool _IsRocket( SDDZPai pai[], int num );

	int _Is2( SDDZPai pai[], int num );


	int _Is3( SDDZPai pai[], int num );

	// 检测是否为炸弹牌型
	int _IsBomb( SDDZPai pai[], int num );


	// 检测是否为单顺牌型
	int _IsDanShun( SDDZPai pai[], int num );


	// 检测是否为双顺牌型
	int _IsShuangShun( SDDZPai pai[], int num );

	// 检测是否为三顺牌型
	int _IsSanShun( SDDZPai pai[], int num );


	// 检测是否为三带一牌型(单张);
	int _IsSanDaiYiSingle( SDDZPai pai[], int num );

	// 检测是否为三带一牌型(对儿);
	int _IsSanDaiYiDouble( SDDZPai pai[], int num );


	// 检测是否为飞机带翅膀牌型(单张);
	int _IsPlaneSingle( SDDZPai pai[], int num );


	// 检测是否为飞机带翅膀牌型(对儿);
	int _IsPlaneDouble( SDDZPai pai[], int num );


	// 检测是否为四带二牌型(单张);
	int _IsSiDaiErSingle( SDDZPai pai[], int num);

	// 检测是否为四带二牌型(对儿);
	int _IsSiDaiErDouble( SDDZPai pai[], int num);


	int GetCardCountByCardNum( SDDZPai pai[], int num, int PaiNum );


	void SortCard( SDDZPai Card[], int num );


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
extern SDDZPai g_DDZPaiInfo[54];
extern SDDZPai * GetDDZPaiInfo(int wId);

extern CNetApp g_NetApp;
#endif /* CNETAPP_H_ */
