package §_-1k§
{
   import com.api.Player;
   import flash.events.MouseEvent;
   import flash.events.TextEvent;
   import menu.§_-cD§;
   import utils.§_-r1G§;
   import views.§_-V2O§;
   import views.§_-z§;
   
   public class §_-E13§ extends §_-G2R§
   {
      
      private var playerId:int = -1;
      
      private var description:§_-i5§ = null;
      
      private var §_-118§:§_-z§ = null;
      
      private var photo:§_-V2O§ = null;
      
      public function §_-E13§(param1:int, param2:int, param3:int, param4:uint)
      {
         super(param1,param2,param4);
         this.playerId = param3;
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
         this.§_-118§ = new §_-z§(8);
         this.§_-118§.x = 55;
         this.§_-118§.y = 13;
         addChild(this.§_-118§);
         var _loc2_:Player = Game.getPlayer(this.playerId);
         _loc2_.addEventListener(§_-Y2E§.§_-s10§ | §_-Y2E§.§_-n2H§ | §_-Y2E§.§_-W1l§,this.§_-K16§);
         this.description = new §_-i5§("",85,25,style);
         this.description.addEventListener(TextEvent.LINK,this.§_-QQ§);
         addChild(this.description);
         Game.request(this.playerId,§_-Y2E§.§_-s10§ | §_-Y2E§.§_-n2H§ | §_-Y2E§.§_-W1l§);
      }
      
      private function §_-QQ§(param1:TextEvent) : void
      {
         §_-cD§.§_-e25§(this.playerId);
      }
      
      private function §_-K16§(param1:Player) : void
      {
         param1.removeEventListener(this.§_-K16§);
         this.photo.§_-yC§(param1);
         this.§_-118§.§_-yC§(param1);
         this.description.text = "<body>" + gls("Поздравляем. Игрок") + "<b>" + §_-r1G§.§_-fU§(param1.name,"event:" + param1.id) + "</b>\n" + gls("вернулся в игру по твоему приглашению.") + "</body>";
      }
      
      private function §_-e25§(param1:MouseEvent) : void
      {
         §_-cD§.§_-e25§(this.playerId);
      }
   }
}

