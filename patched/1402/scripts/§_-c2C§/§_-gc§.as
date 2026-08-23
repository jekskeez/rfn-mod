package §_-c2C§
{
   import §_-X1k§.§_-Wd§;
   import buttons.§_-j2x§;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   import flash.filters.DropShadowFilter;
   import flash.text.TextFormat;
   import views.§_-aW§;
   
   public class §_-gc§ extends Screen
   {
      
      private var §_-t2p§:Sprite = null;
      
      private var §_-03N§:Sprite = null;
      
      public function §_-gc§()
      {
         super();
         this.init();
      }
      
      override public function show() : void
      {
         super.show();
         §_-aW§.instance.open();
         §_-Wd§.§_-H2q§();
         this.§_-w2y§();
      }
      
      private function init() : void
      {
         this.§_-t2p§ = new Sprite();
         addChild(this.§_-t2p§);
         this.§_-03N§ = new Sprite();
         addChild(this.§_-03N§);
         var _loc1_:ScreenDisconnectBackground = new ScreenDisconnectBackground();
         _loc1_.mouseEnabled = false;
         this.§_-03N§.addChild(_loc1_);
         var _loc2_:§_-i5§ = new §_-i5§(gls("Извините, соединение раззззззорвано..."),0,25,new TextFormat(§_-i5§.§_-p1s§,30,16777215));
         _loc2_.x = int((§_-Zy§.§_-21V§ - _loc2_.textWidth) * 0.5);
         _loc2_.filters = [new DropShadowFilter(4,45,0,1,4,4)];
         this.§_-03N§.addChild(_loc2_);
         var _loc3_:§_-j2x§ = new §_-j2x§(gls("Перезапустить игру"),0,21,this.§_-X1t§,2);
         _loc3_.x = int((§_-Zy§.§_-21V§ - _loc3_.width) * 0.5);
         _loc3_.y = 555;
         _loc3_.visible = true;
         this.§_-03N§.addChild(_loc3_);
         §_-73Q§.addEventListener(§_-73Q§.§_-J1D§,this.§_-w2y§);
         this.§_-w2y§();
      }
      
      private function §_-w2y§(param1:Event = null) : void
      {
         var _loc2_:Number = Game.starling.stage.stageWidth;
         var _loc3_:Number = Game.starling.stage.stageHeight;
         this.§_-t2p§.graphics.clear();
         this.§_-t2p§.graphics.beginFill(16800);
         this.§_-t2p§.graphics.drawRect(0,0,_loc2_,_loc3_);
         this.§_-t2p§.graphics.endFill();
         this.§_-03N§.x = (_loc2_ - §_-Zy§.§_-21V§) * 0.5;
         this.§_-03N§.y = (_loc3_ - §_-Zy§.§_-02T§) * 0.5;
      }
      
      private function §_-X1t§(param1:MouseEvent) : void
      {
         try
         {
            ExternalInterface.call("window.location.reload");
         }
         catch(e:Error)
         {
         }
         §_-Vt§.§_-I1C§();
      }
   }
}

