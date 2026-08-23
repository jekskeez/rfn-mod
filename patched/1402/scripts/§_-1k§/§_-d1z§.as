package §_-1k§
{
   import com.api.Player;
   import flash.events.MouseEvent;
   import flash.events.TextEvent;
   import menu.§_-cD§;
   import protocol.§_-s2l§;
   import utils.§_-r1G§;
   import views.§_-V2O§;
   
   public class §_-d1z§ extends §_-G2R§
   {
      
      private var playerId:int = -1;
      
      private var caption:§_-i5§ = null;
      
      private var photo:§_-V2O§ = null;
      
      public function §_-d1z§(param1:int, param2:int, param3:int)
      {
         super(param1,§_-s2l§.§_-z1I§,param3);
         this.playerId = param2;
      }
      
      override public function §_-O1s§() : void
      {
         if(this.photo != null)
         {
            return;
         }
         super.§_-O1s§();
         this.photo = new §_-V2O§(80);
         addChild(this.photo);
         var _loc1_:RatingPlaceButton = new RatingPlaceButton();
         _loc1_.width = this.photo.width;
         _loc1_.height = this.photo.height;
         _loc1_.addEventListener(MouseEvent.MOUSE_UP,this.§_-e25§);
         addChild(_loc1_);
         addChild(new §_-i5§("<body>" + gls("Твой друг") + "</body>",85,10,style));
         this.caption = new §_-i5§("",148,10,style);
         this.caption.addEventListener(TextEvent.LINK,this.§_-QQ§);
         addChild(this.caption);
         var _loc2_:§_-i5§ = new §_-i5§("<body>" + gls("пришедший в «Трагедию белок» по твоему\nприглашению, достиг {0} уровня!",Game.§_-Bq§) + "</body>",85,25,style);
         addChild(_loc2_);
         var _loc3_:Player = Game.getPlayer(this.playerId);
         _loc3_.addEventListener(§_-Y2E§.§_-s10§ | §_-Y2E§.§_-n2H§ | §_-Y2E§.§_-W1l§,this.§_-K16§);
         Game.request(this.playerId,§_-Y2E§.§_-s10§ | §_-Y2E§.§_-n2H§ | §_-Y2E§.§_-W1l§);
      }
      
      private function §_-QQ§(param1:TextEvent) : void
      {
         §_-cD§.§_-e25§(this.playerId);
      }
      
      private function §_-e25§(param1:MouseEvent) : void
      {
         §_-cD§.§_-e25§(this.playerId);
      }
      
      private function §_-K16§(param1:Player) : void
      {
         param1.removeEventListener(this.§_-K16§);
         this.photo.§_-yC§(param1);
         this.caption.htmlText = "<body><b>" + §_-r1G§.§_-fU§(param1.name,"event:" + param1.id) + "</b>,</body>";
      }
   }
}

