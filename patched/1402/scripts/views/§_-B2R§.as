package views
{
   import §_-S1n§.§_-kr§;
   import §_-c2C§.§_-51A§;
   import buttons.§_-613§;
   import com.api.Player;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class §_-B2R§ extends Sprite
   {
      
      private var §_-3t§:§_-613§ = null;
      
      private var §_-hG§:Sprite = null;
      
      private var §_-oj§:§_-kr§ = null;
      
      public function §_-B2R§()
      {
         super();
         this.init();
      }
      
      public function §_-939§(param1:int) : void
      {
         this.hide();
         this.§_-3t§.setState(param1 != Player.WOMAN);
         this.§_-3t§.removeEventListener(MouseEvent.CLICK,this.show);
         this.§_-3t§.mouseChildren = Game.selfId == §_-51A§.playerId;
         if(this.§_-oj§)
         {
            this.§_-oj§.remove();
            this.§_-oj§ = null;
         }
         if(Game.selfId != §_-51A§.playerId)
         {
            return;
         }
         this.§_-3t§.addEventListener(MouseEvent.CLICK,this.show);
         this.§_-oj§ = new §_-kr§(this.§_-3t§,gls("Сменить пол"));
      }
      
      private function §_-d2G§(param1:MouseEvent) : void
      {
         var _loc2_:int = param1.target is ManButton ? int(Player.MAN) : int(Player.WOMAN);
         if(_loc2_ == Game.self.sex)
         {
            this.hide();
            return;
         }
         this.§_-939§(_loc2_);
         Game.§_-01l§({
            "name":Game.self["name"],
            "sex":_loc2_
         });
         Game.request(Game.selfId,§_-Y2E§.§_-qK§,true);
      }
      
      private function hide() : void
      {
         this.§_-hG§.visible = false;
         Game.stage.removeEventListener(MouseEvent.CLICK,this.click);
      }
      
      private function show(param1:MouseEvent) : void
      {
         this.§_-hG§.visible = !this.§_-hG§.visible;
         Game.stage.addEventListener(MouseEvent.CLICK,this.click);
         param1.stopImmediatePropagation();
      }
      
      private function init() : void
      {
         this.§_-hG§ = new Sprite();
         this.§_-hG§.visible = false;
         this.§_-hG§.y = 15;
         addChild(this.§_-hG§);
         var _loc1_:SettingsBackground = new SettingsBackground();
         _loc1_.x = 1;
         _loc1_.width = 23;
         _loc1_.height = 59;
         this.§_-hG§.addChild(_loc1_);
         var _loc2_:ManButton = new ManButton();
         _loc2_.x = 1 + int((this.width - _loc2_.width) * 0.5);
         _loc2_.y = 13;
         _loc2_.addEventListener(MouseEvent.CLICK,this.§_-d2G§);
         this.§_-hG§.addChild(_loc2_);
         new §_-kr§(_loc2_,gls("Мужской"));
         var _loc3_:WomanButton = new WomanButton();
         _loc3_.x = 1 + int((this.width - _loc3_.width) * 0.5);
         _loc3_.y = 36;
         _loc3_.addEventListener(MouseEvent.CLICK,this.§_-d2G§);
         this.§_-hG§.addChild(_loc3_);
         new §_-kr§(_loc3_,gls("Женский"));
         this.§_-3t§ = new §_-613§(new ManIcon(),new WomanIcon(),true);
         addChild(this.§_-3t§);
      }
      
      private function click(param1:MouseEvent) : void
      {
         var _loc2_:Point = Game.§_-q1L§.globalToLocal(new Point(param1.stageX,param1.stageY));
         if(_loc2_.x >= this.x && _loc2_.x <= this.x + this.width && _loc2_.y >= this.y && _loc2_.y <= this.y + this.height)
         {
            return;
         }
         this.hide();
      }
   }
}

