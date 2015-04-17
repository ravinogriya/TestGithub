/**
 * An apex page controller that takes the user to the right start page based on credentials or lack thereof
 */
public with sharing class CustomLandingController {

    // Code we will invoke on page load.
    public PageReference forwardToCustomAuthPage() {
        if(UserInfo.getUserType() == 'Guest'){
            return new PageReference('/CustomLogin');
        }
        else{
            return null;
        }
    }

    public CustomLandingController() {}
}