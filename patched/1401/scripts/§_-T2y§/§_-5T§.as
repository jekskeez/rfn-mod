package §_-T2y§
{
   import §_-I10§.§_-Q2v§;
   import §_-I10§.§_-k1C§;
   import §_-f1x§.§_-72Y§;
   import §_-f1x§.§_-W2G§;
   import §_-k1c§.Dialog;
   import buttons.§_-91k§;
   import buttons.§_-F1F§;
   import buttons.§_-G2L§;
   import buttons.§_-LD§;
   import buttons.§_-T2z§;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import sounds.GameSounds;
   import sounds.§_-43Z§;
   
   public class §_-5T§ extends Screen
   {
      
      private static var _instance:§_-5T§;
      
      public static const §_-HM§:Array = [new TextFormat(§_-22V§.§_-pJ§,16,8746579),new TextFormat(§_-22V§.§_-pJ§,16,16763955),new TextFormat(§_-22V§.§_-pJ§,16,5588515)];
      
      private var §_-P20§:Boolean = false;
      
      private var §_-EE§:§_-G2L§;
      
      private var §_-6A§:§_-F1F§;
      
      private var §_-61H§:§_-F1F§;
      
      private var §_-KL§:Sprite = null;
      
      private var §_-rm§:Sprite = null;
      
      public function §_-5T§()
      {
         _instance = this;
         super();
      }
      
      public static function get instance() : §_-5T§
      {
         return _instance;
      }
      
      override public function show() : void
      {
         super.show();
         if(!this.§_-P20§)
         {
            this.init();
            this.§_-P20§ = true;
         }
         §_-Q2v§.§_-S2y§(§_-Q2v§.§_-3C§);
      }
      
      private function init() : void
      {
         var field:§_-22V§;
         var buttonExit:SimpleButton;
         var screenshotButton:§_-LD§;
         var collectionView:§_-W2G§;
         var clothesView:§_-72Y§;
         this.§_-KL§ = new Sprite();
         addChild(this.§_-KL§);
         this.§_-rm§ = new Sprite();
         addChild(this.§_-rm§);
         this.§_-rm§.addChild(new ScreenCollectionBackground());
         field = new §_-22V§(gls("Коллекции"),0,5,new TextFormat(§_-22V§.§_-pJ§,21,16763904));
         field.x = int((§_-a9§.§_-9o§ - field.textWidth) * 0.5);
         field.filters = Dialog.§_-m2A§;
         this.§_-rm§.addChild(field);
         buttonExit = new §_-91k§();
         buttonExit.x = 870;
         buttonExit.y = 10;
         buttonExit.addEventListener(MouseEvent.CLICK,function(param1:MouseEvent):void
         {
            GameSounds.play(§_-43Z§.§_-o1e§);
            §_-71o§.show(§_-71o§.§_-n2M§);
         });
         this.§_-rm§.addChild(buttonExit);
         screenshotButton = new §_-LD§(true);
         screenshotButton.x = 830;
         screenshotButton.y = 10;
         this.§_-rm§.addChild(screenshotButton);
         collectionView = new §_-W2G§();
         this.§_-rm§.addChild(collectionView);
         clothesView = new §_-72Y§();
         this.§_-rm§.addChild(clothesView);
         this.§_-61H§ = new §_-F1F§(new §_-T2z§(gls("Наборы коллекций"),§_-HM§,ButtonCollectionTabBack,5));
         this.§_-61H§.x = 17;
         this.§_-61H§.y = 42;
         this.§_-6A§ = new §_-F1F§(new §_-T2z§(gls("Награда за коллекции"),§_-HM§,ButtonCollectionTabBack,5));
         this.§_-6A§.x = 451;
         this.§_-6A§.y = 42;
         this.§_-EE§ = new §_-G2L§();
         this.§_-EE§.insert(this.§_-61H§,collectionView);
         this.§_-EE§.insert(this.§_-6A§,clothesView);
         this.§_-rm§.addChild(this.§_-EE§);
         §_-k1C§.§_-sY§();
         §_-K1r§.addEventListener(§_-K1r§.§_-n2V§,this.§_-5W§);
         this.§_-5W§();
      }
      
      private function §_-5W§(param1:Event = null) : void
      {
         var _loc2_:Number = Game.starling.stage.stageWidth;
         var _loc3_:Number = Game.starling.stage.stageHeight;
         this.§_-KL§.graphics.clear();
         this.§_-KL§.graphics.beginFill(16183517);
         this.§_-KL§.graphics.drawRect(0,0,_loc2_,_loc3_);
         this.§_-KL§.graphics.endFill();
         this.§_-rm§.x = (_loc2_ - §_-a9§.§_-9o§) * 0.5;
         this.§_-rm§.y = (_loc3_ - §_-a9§.§_-31m§) * 0.5;
      }
   }
}

