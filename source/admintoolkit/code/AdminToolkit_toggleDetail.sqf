private ['_toggle', '_display'];
disableSerialization;
_toggle = _this;
_display = findDisplay 40000;

(_display displayCtrl RscAdminToolkitDetailList_IDC) ctrlShow _toggle;
(_display displayCtrl RscAdminToolkitEditDetail_IDC) ctrlShow _toggle;
(_display displayCtrl RscAdminToolkitSearchDetail_IDC) ctrlShow _toggle;