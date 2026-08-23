package tape
{
   import §_-68§.§_-EI§;
   import §_-I10§.NotificationManager;
   import §_-e1G§.§_-Hb§;
   import §_-k1c§.Dialog;
   import §_-k1c§.§_-122§;
   import buttons.§_-j18§;
   import events.GameEvent;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import views.§_-E8§;
   
   public class §_-Dv§ extends Sprite
   {
      
      private var §_-92G§:§_-Q9§ = null;
      
      private var §_-i1N§:§_-DO§;
      
      private var §_-p3§:Dialog;
      
      private var §_-A26§:§_-j18§;
      
      private var §_-32V§:§_-j18§;
      
      public function §_-Dv§()
      {
         super();
         this.§_-92G§ = new §_-Q9§();
         addChild(this.§_-92G§);
         this.§_-i1N§ = new §_-DO§();
         this.§_-i1N§.addEventListener(GameEvent.FRIENDS_UPDATE,this.§_-52U§);
         this.§_-92G§.setData(this.§_-i1N§);
         this.§_-A26§ = new §_-j18§(gls("Вернуть"),100,14,this.§_-a4§);
         this.§_-A26§.scaleX = this.§_-A26§.scaleY = 0.75;
         this.§_-A26§.x = 5;
         this.§_-A26§.y = 10;
         addChild(this.§_-A26§);
         new §_-Hb§(this.§_-A26§,gls("Вернуть друзей"));
         NotificationManager.instance.§_-P2Y§(NotificationManager.§_-C2F§,new §_-E8§(this.§_-A26§,60,10));
         this.§_-32V§ = new §_-j18§(gls("Пригласить"),100,12,Game.inviteFriendsByKey);
         this.§_-32V§.scaleX = this.§_-32V§.scaleY = 0.75;
         this.§_-32V§.x = 5;
         this.§_-32V§.y = 40;
         addChild(this.§_-32V§);
         new §_-Hb§(this.§_-32V§,gls("Пригласить друзей"));
      }
      
      private function §_-a4§(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         §_-EI§.load(function():void
         {
            if(!§_-p3§)
            {
               §_-p3§ = new §_-122§();
            }
            §_-p3§.show();
         });
      }
      
      private function §_-52U§(param1:GameEvent) : void
      {
         this.§_-92G§.setData(this.§_-i1N§);
      }
   }
}

