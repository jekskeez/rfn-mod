package §_-T2y§
{
   import §_-I10§.§_-Q2v§;
   import §_-k1c§.Dialog;
   import buttons.§_-91k§;
   import buttons.§_-LD§;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import sounds.GameSounds;
   import sounds.§_-43Z§;
   import views.§_-C3S§;
   
   public class §_-J29§ extends Screen
   {
      
      private static var _instance:§_-J29§;
      
      public static var §_-N1g§:int = 0;
      
      private var §_-V2u§:§_-C3S§ = null;
      
      private var §_-P20§:Boolean = false;
      
      private var §_-KL§:Sprite = null;
      
      private var §_-rm§:Sprite = null;
      
      public function §_-J29§()
      {
         super();
         _instance = this;
      }
      
      public static function get instance() : §_-J29§
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
         this.§_-V2u§.§_-027§();
         §_-Q2v§.§_-S2y§(§_-Q2v§.§_-F2§);
      }
      
      private function init() : void
      {
         var field:§_-22V§;
         var buttonExit:SimpleButton;
         var screenshotButton:§_-LD§;
         this.§_-KL§ = new Sprite();
         addChild(this.§_-KL§);
         this.§_-rm§ = new Sprite();
         addChild(this.§_-rm§);
         this.§_-rm§.graphics.beginFill(16249053);
         this.§_-rm§.graphics.drawRect(0,0,§_-a9§.§_-9o§,§_-a9§.§_-31m§);
         this.§_-rm§.graphics.beginFill(11964012,0.4);
         this.§_-rm§.graphics.drawRect(0,80,§_-a9§.§_-9o§,62);
         field = new §_-22V§(gls("Достижения"),0,5,new TextFormat(§_-22V§.§_-pJ§,21,16763904));
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
         this.§_-V2u§ = new §_-C3S§();
         this.§_-rm§.addChild(this.§_-V2u§);
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

