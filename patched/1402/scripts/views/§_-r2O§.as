package views
{
   import §_-X1k§.§_-XW§;
   import buttons.§_-K2G§;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import protocol.Connection;
   import protocol.§_-u1O§;
   import utils.§_-72U§;
   
   public class §_-r2O§ extends Sprite
   {
      
      private var §_-D2w§:§_-72U§;
      
      public function §_-r2O§()
      {
         super();
         var _loc1_:Sprite = new Sprite();
         _loc1_.graphics.beginFill(15524553);
         _loc1_.graphics.drawRoundRectComplex(0,0,325,85,7.5,7.5,7.5,7.5);
         _loc1_.graphics.endFill();
         addChild(_loc1_);
         var _loc2_:TextFormat = new TextFormat(null,14,4666410,false);
         _loc2_.align = TextFormatAlign.CENTER;
         _loc2_.leading = 2.5;
         var _loc3_:§_-i5§ = new §_-i5§(gls("Минимальный уровень для\nвступления в клан"),0,10,_loc2_);
         _loc3_.x = (_loc1_.width >> 1) - (_loc3_.width >> 1);
         addChild(_loc3_);
         var _loc4_:TextFormat = new TextFormat(§_-i5§.§_-c10§,14,0,true);
         var _loc5_:Sprite = new Sprite();
         _loc5_.y = _loc3_.y + _loc3_.height + 5;
         this.§_-D2w§ = new §_-72U§("",0,0,30,20,_loc4_,_loc4_,§_-XW§.§_-wC§.toString().length);
         this.§_-D2w§.restrict = "0-9";
         _loc5_.addChild(this.§_-D2w§);
         var _loc6_:§_-K2G§ = new §_-K2G§(gls("Ок"));
         _loc6_.x = this.§_-D2w§.x + this.§_-D2w§.width + 10;
         _loc6_.y = this.§_-D2w§.y - 4;
         _loc6_.addEventListener(MouseEvent.CLICK,this.§_-H1h§);
         _loc5_.addChild(_loc6_);
         _loc5_.x = (_loc1_.width >> 1) - (_loc5_.width >> 1);
         addChild(_loc5_);
      }
      
      public function get §_-5S§() : int
      {
         return int(this.§_-D2w§.text);
      }
      
      public function set §_-5S§(param1:int) : void
      {
         this.§_-D2w§.text = Math.max(Math.min(param1,§_-XW§.§_-wC§),§_-XW§.§_-I1V§).toString();
      }
      
      private function §_-H1h§(param1:MouseEvent) : void
      {
         this.§_-5S§ = int(this.§_-D2w§.text);
         Connection.§_-e2T§(§_-u1O§.§_-b1a§,this.§_-5S§);
      }
   }
}

