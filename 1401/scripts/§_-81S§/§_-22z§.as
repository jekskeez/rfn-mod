package §_-81S§
{
   import com.api.Player;
   import flash.events.MouseEvent;
   import flash.events.TextEvent;
   import menu.§_-927§;
   import utils.§_-xb§;
   import views.§_-B1w§;
   import views.§_-s1A§;
   
   public class §_-22z§ extends §_-33w§
   {
      
      private var playerId:int = -1;
      
      private var description:§_-22V§ = null;
      
      private var §_-Gg§:§_-B1w§ = null;
      
      private var photo:§_-s1A§ = null;
      
      public function §_-22z§(param1:int, param2:int, param3:int, param4:uint)
      {
         super(param1,param2,param4);
         this.playerId = param3;
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
         this.§_-Gg§ = new §_-B1w§(8);
         this.§_-Gg§.x = 55;
         this.§_-Gg§.y = 13;
         addChild(this.§_-Gg§);
         var _loc2_:Player = Game.getPlayer(this.playerId);
         _loc2_.addEventListener(§_-hF§.§_-31X§ | §_-hF§.§_-31q§ | §_-hF§.§_-B3k§,this.§_-rF§);
         this.description = new §_-22V§("",85,25,style);
         this.description.addEventListener(TextEvent.LINK,this.§_-o1P§);
         addChild(this.description);
         Game.request(this.playerId,§_-hF§.§_-31X§ | §_-hF§.§_-31q§ | §_-hF§.§_-B3k§);
      }
      
      private function §_-o1P§(param1:TextEvent) : void
      {
         §_-927§.§_-i2I§(this.playerId);
      }
      
      private function §_-rF§(param1:Player) : void
      {
         param1.removeEventListener(this.§_-rF§);
         this.photo.§_-031§(param1);
         this.§_-Gg§.§_-031§(param1);
         this.description.text = "<body>" + gls("Поздравляем. Игрок") + "<b>" + §_-xb§.§_-e1r§(param1.name,"event:" + param1.id) + "</b>\n" + gls("вернулся в игру по твоему приглашению.") + "</body>";
      }
      
      private function §_-i2I§(param1:MouseEvent) : void
      {
         §_-927§.§_-i2I§(this.playerId);
      }
   }
}

