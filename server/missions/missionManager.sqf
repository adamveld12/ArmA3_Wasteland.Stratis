//	@file Version: 1.1
//	@file Name: mainMissionController.sqf
//	@file Author: M6dEEp
//	@file Created: 09/24/2014 23:00

if (!isServer) exitWith {};


private ["_concurrentSideMissions", "_concurrentMainMissions", "_concurrentMoneyMissions", "_mainMission", "_sideMission", "_moneyMission"];

_concurrentSideMissions = 4;
_concurrentMainMissions = 2;
_concurrentMoneyMissions = 2;

_mainMission = "server\missions\mainMissionController.sqf";
_sideMission = "server\missions\sideMissionController.sqf";
_moneyMission = "server\missions\moneyMissionController.sqf";

diag_log "Starting Mission Manager....";

for "_x" from 0 to _concurrentSideMissions do
{
  [] execVM _sideMission;
  sleep 2;
};

for "_x" from 0 to _concurrentMainMissions do
{
  [] execVM _mainMission;
  sleep 2*60;
};

for "_x" from 0 to _concurrentMainMissions do
{
  [] execVM _moneyMission;
  sleep 2*60;
};
