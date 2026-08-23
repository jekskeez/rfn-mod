package tape
{
   import §_-S1n§.§_-kr§;
   import §_-X1k§.NotificationManager;
   import §_-bN§.Dialog;
   import §_-bN§.§_-M1x§;
   import §_-s2e§.§_-U2d§;
   import buttons.§_-K2G§;
   import events.GameEvent;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import views.§_-O2q§;
   
   public class §_-02g§ extends Sprite
   {
      
      private var §_-iN§:§_-E2i§ = null;
      
      private var §_-A3Z§:§_-z1W§;
      
      private var §_-A1W§:Dialog;
      
      private var §_-K12§:§_-K2G§;
      
      private var §_-j0§:§_-K2G§;
      
      public function §_-02g§()
      {
         super();
         this.§_-iN§ = new §_-E2i§();
         addChild(this.§_-iN§);
         this.§_-A3Z§ = new §_-z1W§();
         this.§_-A3Z§.addEventListener(GameEvent.FRIENDS_UPDATE,this.§_-v1S§);
         this.§_-iN§.setData(this.§_-A3Z§);
         this.§_-K12§ = new §_-K2G§(gls("Вернуть"),100,14,this.§_-J2r§);
         this.§_-K12§.scaleX = this.§_-K12§.scaleY = 0.75;
         this.§_-K12§.x = 5;
         this.§_-K12§.y = 10;
         addChild(this.§_-K12§);
         new §_-kr§(this.§_-K12§,gls("Вернуть друзей"));
         NotificationManager.instance.§_-a1K§(NotificationManager.§_-53c§,new §_-O2q§(this.§_-K12§,60,10));
         this.§_-j0§ = new §_-K2G§(gls("Пригласить"),100,12,Game.inviteFriendsByKey);
         this.§_-j0§.scaleX = this.§_-j0§.scaleY = 0.75;
         this.§_-j0§.x = 5;
         this.§_-j0§.y = 40;
         addChild(this.§_-j0§);
         new §_-kr§(this.§_-j0§,gls("Пригласить друзей"));
      }
      
      private function §_-J2r§(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         §_-U2d§.load(function():void
         {
            if(!§_-A1W§)
            {
               §_-A1W§ = new §_-M1x§();
            }
            §_-A1W§.show();
         });
      }
      
      private function §_-v1S§(param1:GameEvent) : void
      {
         this.§_-iN§.setData(this.§_-A3Z§);
      }
   }
}

