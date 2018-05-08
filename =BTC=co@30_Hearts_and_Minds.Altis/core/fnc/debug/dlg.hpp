class TER_fpscounter
{
    idd = 73001;
    duration = 1e+1000;
    onLoad = "_this call btc_fnc_debug_fps;";
    class controls
    {
        class IGUIBack_2200: IGUIBack
        {
            idc = 2200;
            x = 0.5525 * safezoneW + safezoneX;
            y = 0.71 * safezoneH + safezoneY;
            w = 0.433125 * safezoneW;
            h = 0.266 * safezoneH;
        };
        class GRP_frames: RscControlsGroupNoScrollbars
        {
            idc = 9901;
            x = 0.5525 * safezoneW + safezoneX;
            y = 0.71 * safezoneH + safezoneY;
            w = 0.433125 * safezoneW;
            h = 0.266 * safezoneH;
        };
        class TXT_fps: RscText
        {
            idc = 1000;
            text = "FPS: 60.00";
            x = 0.5525 * safezoneW + safezoneX;
            y = 0.71 * safezoneH + safezoneY;
            w = 0.0590625 * safezoneW;
            h = 0.028 * safezoneH;
        };
        class RscText_1001: RscText
        {
            idc = 1001;
            text = "Time";
            x = 0.933125 * safezoneW + safezoneX;
            y = 0.948 * safezoneH + safezoneY;
            w = 0.0459375 * safezoneW;
            h = 0.028 * safezoneH;
        };
    };
};
