package views
{
   import §_-I10§.§_-My§;
   import buttons.§_-j18§;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import protocol.Connection;
   import protocol.§_-h2B§;
   import utils.§_-w2j§;
   
   public class §_-b1§ extends Sprite
   {
      
      private var §_-Qr§:§_-w2j§;
      
      public function §_-b1§()
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
         var _loc3_:§_-22V§ = new §_-22V§(gls("Минимальный уровень для\nвступления в клан"),0,10,_loc2_);
         _loc3_.x = (_loc1_.width >> 1) - (_loc3_.width >> 1);
         addChild(_loc3_);
         var _loc4_:TextFormat = new TextFormat(§_-22V§.§_-F2z§,14,0,true);
         var _loc5_:Sprite = new Sprite();
         _loc5_.y = _loc3_.y + _loc3_.height + 5;
         this.§_-Qr§ = new §_-w2j§("",0,0,30,20,_loc4_,_loc4_,§_-My§.§_-F2b§.toString().length);
         this.§_-Qr§.restrict = "0-9";
         _loc5_.addChild(this.§_-Qr§);
         var _loc6_:§_-j18§ = new §_-j18§(gls("Ок"));
         _loc6_.x = this.§_-Qr§.x + this.§_-Qr§.width + 10;
         _loc6_.y = this.§_-Qr§.y - 4;
         _loc6_.addEventListener(MouseEvent.CLICK,this.§_-P2v§);
         _loc5_.addChild(_loc6_);
         _loc5_.x = (_loc1_.width >> 1) - (_loc5_.width >> 1);
         addChild(_loc5_);
      }
      
      public function get §_-KM§() : int
      {
         return int(this.§_-Qr§.text);
      }
      
      public function set §_-KM§(param1:int) : void
      {
         this.§_-Qr§.text = Math.max(Math.min(param1,§_-My§.§_-F2b§),§_-My§.§_-U1R§).toString();
      }
      
      private function §_-P2v§(param1:MouseEvent) : void
      {
         this.§_-KM§ = int(this.§_-Qr§.text);
         Connection.§_-Li§(§_-h2B§.§_-j1W§,this.§_-KM§);
      }
   }
}

