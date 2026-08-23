package §_-81S§
{
   import com.api.Player;
   import flash.events.MouseEvent;
   import flash.events.TextEvent;
   import menu.§_-927§;
   import protocol.§_-S2I§;
   import utils.§_-xb§;
   import views.§_-s1A§;
   
   public class §_-h1P§ extends §_-33w§
   {
      
      private var playerId:int = -1;
      
      private var caption:§_-22V§ = null;
      
      private var photo:§_-s1A§ = null;
      
      public function §_-h1P§(param1:int, param2:int, param3:int)
      {
         super(param1,§_-S2I§.§_-ak§,param3);
         this.playerId = param2;
      }
      
      override public function §_-027§() : void
      {
         if(this.photo != null)
         {
            return;
         }
         super.§_-027§();
         this.photo = new §_-s1A§(80);
         addChild(this.photo);
         var _loc1_:RatingPlaceButton = new RatingPlaceButton();
         _loc1_.width = this.photo.width;
         _loc1_.height = this.photo.height;
         _loc1_.addEventListener(MouseEvent.MOUSE_UP,this.§_-i2I§);
         addChild(_loc1_);
         addChild(new §_-22V§("<body>" + gls("Твой друг") + "</body>",85,10,style));
         this.caption = new §_-22V§("",148,10,style);
         this.caption.addEventListener(TextEvent.LINK,this.§_-o1P§);
         addChild(this.caption);
         var _loc2_:§_-22V§ = new §_-22V§("<body>" + gls("пришедший в «Трагедию белок» по твоему\nприглашению, достиг {0} уровня!",Game.§_-L1O§) + "</body>",85,25,style);
         addChild(_loc2_);
         var _loc3_:Player = Game.getPlayer(this.playerId);
         _loc3_.addEventListener(§_-hF§.§_-31X§ | §_-hF§.§_-31q§ | §_-hF§.§_-B3k§,this.§_-rF§);
         Game.request(this.playerId,§_-hF§.§_-31X§ | §_-hF§.§_-31q§ | §_-hF§.§_-B3k§);
      }
      
      private function §_-o1P§(param1:TextEvent) : void
      {
         §_-927§.§_-i2I§(this.playerId);
      }
      
      private function §_-i2I§(param1:MouseEvent) : void
      {
         §_-927§.§_-i2I§(this.playerId);
      }
      
      private function §_-rF§(param1:Player) : void
      {
         param1.removeEventListener(this.§_-rF§);
         this.photo.§_-031§(param1);
         this.caption.htmlText = "<body><b>" + §_-xb§.§_-e1r§(param1.name,"event:" + param1.id) + "</b>,</body>";
      }
   }
}

