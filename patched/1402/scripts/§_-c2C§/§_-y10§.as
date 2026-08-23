package §_-c2C§
{
   import §_-X1k§.§_-Ac§;
   import §_-bN§.Dialog;
   import buttons.§_-917§;
   import buttons.§_-Z2B§;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import sounds.GameSounds;
   import sounds.§_-RH§;
   import views.§_-B2y§;
   
   public class §_-y10§ extends Screen
   {
      
      private static var _instance:§_-y10§;
      
      public static var §_-C10§:int = 0;
      
      private var §_-o2s§:§_-B2y§ = null;
      
      private var §_-u21§:Boolean = false;
      
      private var §_-t2p§:Sprite = null;
      
      private var §_-03N§:Sprite = null;
      
      public function §_-y10§()
      {
         super();
         _instance = this;
      }
      
      public static function get instance() : §_-y10§
      {
         return _instance;
      }
      
      override public function show() : void
      {
         super.show();
         if(!this.§_-u21§)
         {
            this.init();
            this.§_-u21§ = true;
         }
         this.§_-o2s§.§_-O1s§();
         §_-Ac§.§_-91§(§_-Ac§.§_-h15§);
      }
      
      private function init() : void
      {
         var field:§_-i5§;
         var buttonExit:SimpleButton;
         var screenshotButton:§_-Z2B§;
         this.§_-t2p§ = new Sprite();
         addChild(this.§_-t2p§);
         this.§_-03N§ = new Sprite();
         addChild(this.§_-03N§);
         this.§_-03N§.graphics.beginFill(16249053);
         this.§_-03N§.graphics.drawRect(0,0,§_-Zy§.§_-21V§,§_-Zy§.§_-02T§);
         this.§_-03N§.graphics.beginFill(11964012,0.4);
         this.§_-03N§.graphics.drawRect(0,80,§_-Zy§.§_-21V§,62);
         field = new §_-i5§(gls("Достижения"),0,5,new TextFormat(§_-i5§.§_-p1s§,21,16763904));
         field.x = int((§_-Zy§.§_-21V§ - field.textWidth) * 0.5);
         field.filters = Dialog.§_-q2I§;
         this.§_-03N§.addChild(field);
         buttonExit = new §_-917§();
         buttonExit.x = 870;
         buttonExit.y = 10;
         buttonExit.addEventListener(MouseEvent.CLICK,function(param1:MouseEvent):void
         {
            GameSounds.play(§_-RH§.§_-K10§);
            §_-t2c§.show(§_-t2c§.§_-di§);
         });
         this.§_-03N§.addChild(buttonExit);
         screenshotButton = new §_-Z2B§(true);
         screenshotButton.x = 830;
         screenshotButton.y = 10;
         this.§_-03N§.addChild(screenshotButton);
         this.§_-o2s§ = new §_-B2y§();
         this.§_-03N§.addChild(this.§_-o2s§);
         §_-73Q§.addEventListener(§_-73Q§.§_-J1D§,this.§_-w2y§);
         this.§_-w2y§();
      }
      
      private function §_-w2y§(param1:Event = null) : void
      {
         var _loc2_:Number = Game.starling.stage.stageWidth;
         var _loc3_:Number = Game.starling.stage.stageHeight;
         this.§_-t2p§.graphics.clear();
         this.§_-t2p§.graphics.beginFill(16183517);
         this.§_-t2p§.graphics.drawRect(0,0,_loc2_,_loc3_);
         this.§_-t2p§.graphics.endFill();
         this.§_-03N§.x = (_loc2_ - §_-Zy§.§_-21V§) * 0.5;
         this.§_-03N§.y = (_loc3_ - §_-Zy§.§_-02T§) * 0.5;
      }
   }
}

