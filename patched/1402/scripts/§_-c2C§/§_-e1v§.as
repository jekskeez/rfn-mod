package §_-c2C§
{
   import §_-5T§.§_-22e§;
   import §_-5T§.§_-S2l§;
   import §_-X1k§.§_-Ac§;
   import §_-X1k§.§_-WS§;
   import §_-bN§.Dialog;
   import buttons.§_-917§;
   import buttons.§_-Hg§;
   import buttons.§_-Q1W§;
   import buttons.§_-Z2B§;
   import buttons.§_-uH§;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import sounds.GameSounds;
   import sounds.§_-RH§;
   
   public class §_-e1v§ extends Screen
   {
      
      private static var _instance:§_-e1v§;
      
      public static const §_-D12§:Array = [new TextFormat(§_-i5§.§_-p1s§,16,8746579),new TextFormat(§_-i5§.§_-p1s§,16,16763955),new TextFormat(§_-i5§.§_-p1s§,16,5588515)];
      
      private var §_-u21§:Boolean = false;
      
      private var §_-S8§:§_-Hg§;
      
      private var §_-pG§:§_-uH§;
      
      private var §_-81§:§_-uH§;
      
      private var §_-t2p§:Sprite = null;
      
      private var §_-03N§:Sprite = null;
      
      public function §_-e1v§()
      {
         _instance = this;
         super();
      }
      
      public static function get instance() : §_-e1v§
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
         §_-Ac§.§_-91§(§_-Ac§.§_-9h§);
      }
      
      private function init() : void
      {
         var field:§_-i5§;
         var buttonExit:SimpleButton;
         var screenshotButton:§_-Z2B§;
         var collectionView:§_-S2l§;
         var clothesView:§_-22e§;
         this.§_-t2p§ = new Sprite();
         addChild(this.§_-t2p§);
         this.§_-03N§ = new Sprite();
         addChild(this.§_-03N§);
         this.§_-03N§.addChild(new ScreenCollectionBackground());
         field = new §_-i5§(gls("Коллекции"),0,5,new TextFormat(§_-i5§.§_-p1s§,21,16763904));
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
         collectionView = new §_-S2l§();
         this.§_-03N§.addChild(collectionView);
         clothesView = new §_-22e§();
         this.§_-03N§.addChild(clothesView);
         this.§_-81§ = new §_-uH§(new §_-Q1W§(gls("Наборы коллекций"),§_-D12§,ButtonCollectionTabBack,5));
         this.§_-81§.x = 17;
         this.§_-81§.y = 42;
         this.§_-pG§ = new §_-uH§(new §_-Q1W§(gls("Награда за коллекции"),§_-D12§,ButtonCollectionTabBack,5));
         this.§_-pG§.x = 451;
         this.§_-pG§.y = 42;
         this.§_-S8§ = new §_-Hg§();
         this.§_-S8§.insert(this.§_-81§,collectionView);
         this.§_-S8§.insert(this.§_-pG§,clothesView);
         this.§_-03N§.addChild(this.§_-S8§);
         §_-WS§.§_-C1q§();
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

