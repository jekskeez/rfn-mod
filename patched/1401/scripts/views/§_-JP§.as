package views
{
   import §_-T2y§.§_-5B§;
   import §_-e1G§.§_-Hb§;
   import buttons.§_-wc§;
   import com.api.Player;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class §_-JP§ extends Sprite
   {
      
      private var §_-j1Y§:§_-wc§ = null;
      
      private var §_-MP§:Sprite = null;
      
      private var §_-XW§:§_-Hb§ = null;
      
      public function §_-JP§()
      {
         super();
         this.init();
      }
      
      public function §_-Tx§(param1:int) : void
      {
         this.hide();
         this.§_-j1Y§.setState(param1 != Player.WOMAN);
         this.§_-j1Y§.removeEventListener(MouseEvent.CLICK,this.show);
         this.§_-j1Y§.mouseChildren = Game.selfId == §_-5B§.playerId;
         if(this.§_-XW§)
         {
            this.§_-XW§.remove();
            this.§_-XW§ = null;
         }
         if(Game.selfId != §_-5B§.playerId)
         {
            return;
         }
         this.§_-j1Y§.addEventListener(MouseEvent.CLICK,this.show);
         this.§_-XW§ = new §_-Hb§(this.§_-j1Y§,gls("Сменить пол"));
      }
      
      private function §_-Vl§(param1:MouseEvent) : void
      {
         var _loc2_:int = param1.target is ManButton ? int(Player.MAN) : int(Player.WOMAN);
         if(_loc2_ == Game.self.sex)
         {
            this.hide();
            return;
         }
         this.§_-Tx§(_loc2_);
         Game.§_-tR§({
            "name":Game.self["name"],
            "sex":_loc2_
         });
         Game.request(Game.selfId,§_-hF§.§_-R2P§,true);
      }
      
      private function hide() : void
      {
         this.§_-MP§.visible = false;
         Game.stage.removeEventListener(MouseEvent.CLICK,this.click);
      }
      
      private function show(param1:MouseEvent) : void
      {
         this.§_-MP§.visible = !this.§_-MP§.visible;
         Game.stage.addEventListener(MouseEvent.CLICK,this.click);
         param1.stopImmediatePropagation();
      }
      
      private function init() : void
      {
         this.§_-MP§ = new Sprite();
         this.§_-MP§.visible = false;
         this.§_-MP§.y = 15;
         addChild(this.§_-MP§);
         var _loc1_:SettingsBackground = new SettingsBackground();
         _loc1_.x = 1;
         _loc1_.width = 23;
         _loc1_.height = 59;
         this.§_-MP§.addChild(_loc1_);
         var _loc2_:ManButton = new ManButton();
         _loc2_.x = 1 + int((this.width - _loc2_.width) * 0.5);
         _loc2_.y = 13;
         _loc2_.addEventListener(MouseEvent.CLICK,this.§_-Vl§);
         this.§_-MP§.addChild(_loc2_);
         new §_-Hb§(_loc2_,gls("Мужской"));
         var _loc3_:WomanButton = new WomanButton();
         _loc3_.x = 1 + int((this.width - _loc3_.width) * 0.5);
         _loc3_.y = 36;
         _loc3_.addEventListener(MouseEvent.CLICK,this.§_-Vl§);
         this.§_-MP§.addChild(_loc3_);
         new §_-Hb§(_loc3_,gls("Женский"));
         this.§_-j1Y§ = new §_-wc§(new ManIcon(),new WomanIcon(),true);
         addChild(this.§_-j1Y§);
      }
      
      private function click(param1:MouseEvent) : void
      {
         var _loc2_:Point = Game.§_-d2t§.globalToLocal(new Point(param1.stageX,param1.stageY));
         if(_loc2_.x >= this.x && _loc2_.x <= this.x + this.width && _loc2_.y >= this.y && _loc2_.y <= this.y + this.height)
         {
            return;
         }
         this.hide();
      }
   }
}

