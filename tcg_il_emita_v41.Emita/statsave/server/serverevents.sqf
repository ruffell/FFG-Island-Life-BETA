waitUntil{loadedfunc == 1};
loadedevents = 0;
"supdate" addPublicVariableEventHandler 
{
	(_this select 1) spawn Save_update;
};
"newaccount" addPublicVariableEventHandler 
{
	(_this select 1) spawn Save_new;
};
"loadSprofile" addPublicVariableEventHandler 
{
	(_this select 1) spawn load_profile;
};
"sloop" addPublicVariableEventHandler 
{
	(_this select 1) spawn presistent_saving;
};
loadedevents = 1;

