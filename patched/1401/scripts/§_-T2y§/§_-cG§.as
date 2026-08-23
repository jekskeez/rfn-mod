package §_-T2y§
{
   import §_-I10§.§_-S16§;
   import buttons.§_-hH§;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   import flash.filters.DropShadowFilter;
   import flash.text.TextFormat;
   import views.§_-Vm§;
   
   public class §_-cG§ extends Screen
   {
      
      private var §_-KL§:Sprite = null;
      
      private var §_-rm§:Sprite = null;
      
      public function §_-cG§()
      {
         super();
         this.init();
      }
      
      override public function show() : void
      {
         super.show();
         §_-Vm§.instance.open();
         §_-S16§.§_-R2D§();
         this.§_-5W§();
      }
      
      private function init() : void
      {
         this.§_-KL§ = new Sprite();
         addChild(this.§_-KL§);
         this.§_-rm§ = new Sprite();
         addChild(this.§_-rm§);
         var _loc1_:ScreenDisconnectBackground = new ScreenDisconnectBackground();
         _loc1_.mouseEnabled = false;
         this.§_-rm§.addChild(_loc1_);
         var _loc2_:§_-22V§ = new §_-22V§(gls("Извините, соединение раззззззорвано..."),0,25,new TextFormat(§_-22V§.§_-pJ§,30,16777215));
         _loc2_.x = int((§_-a9§.§_-9o§ - _loc2_.textWidth) * 0.5);
         _loc2_.filters = [new DropShadowFilter(4,45,0,1,4,4)];
         this.§_-rm§.addChild(_loc2_);
         var _loc3_:§_-hH§ = new §_-hH§(gls("Перезапустить игру"),0,21,this.§_-13e§,2);
         _loc3_.x = int((§_-a9§.§_-9o§ - _loc3_.width) * 0.5);
         _loc3_.y = 555;
         _loc3_.visible = !§_-b1M§.§_-Ea§;
         this.§_-rm§.addChild(_loc3_);
         §_-K1r§.addEventListener(§_-K1r§.§_-n2V§,this.§_-5W§);
         this.§_-5W§();
      }
      
      private function §_-5W§(param1:Event = null) : void
      {
         var _loc2_:Number = Game.starling.stage.stageWidth;
         var _loc3_:Number = Game.starling.stage.stageHeight;
         this.§_-KL§.graphics.clear();
         this.§_-KL§.graphics.beginFill(16800);
         this.§_-KL§.graphics.drawRect(0,0,_loc2_,_loc3_);
         this.§_-KL§.graphics.endFill();
         this.§_-rm§.x = (_loc2_ - §_-a9§.§_-9o§) * 0.5;
         this.§_-rm§.y = (_loc3_ - §_-a9§.§_-31m§) * 0.5;
      }
      
      private function §_-13e§(param1:MouseEvent) : void
      {
         try
         {
            ExternalInterface.call("window.location.reload");
         }
         catch(e:Error)
         {
         }
         §_-b1M§.§_-W1o§();
      }
   }
}

