package §_-a1J§
{
   import §_-48§.ListDataEvent;
   import §_-B1G§.ScrollPane;
   import §_-cA§.§_-S2N§;
   import flash.display.Sprite;
   import views.§_-91L§;
   import views.§_-9i§;
   
   public class §_-P1p§ extends §_-M2N§
   {
      
      public function §_-P1p§()
      {
         super(null);
      }
      
      override public function show() : void
      {
         super.show();
         this.§_-x2T§.visible = false;
         this.placeOnResize();
         this.§_-R1I§.x = (this.width - this.§_-R1I§.width) * 0.5 - 10;
         this.§_-R1I§.y = this.height - 76;
         addChild(this.§_-R1I§);
      }
      
      override protected function placeOnResize() : void
      {
         this.x = Game.starling.stage.stageWidth - this.width;
         this.y = 95;
      }
      
      override protected function set setBgHeight(param1:int) : void
      {
      }
      
      override protected function setDefaultSize() : void
      {
         this.§_-01q§ = 15;
         this.§_-7N§ = 20;
         this.topOffset = 10;
         this.§_-f2d§ = 0;
      }
      
      override protected function init(param1:Class) : void
      {
         var _loc2_:int = 340;
         this.§_-oX§ = true;
         this.drawBackground = true;
         this.caption = gls("Результаты раунда");
         place();
         this.width = 300;
         this.height = _loc2_;
         this.§_-V1I§ = new Sprite();
         this.§_-V1I§.y = this.height - 20;
         this.§_-R1I§ = §_-91L§.instance;
         this.§_-G19§ = new §_-9i§();
         this.§_-G19§.addEventListener(ListDataEvent.SORTED,§_-ZV§);
         this.§_-Bo§ = new §_-S2N§();
         this.§_-Bo§.x = 0;
         this.§_-Bo§.y = 0;
         this.§_-Bo§.setData(this.§_-G19§);
         this.§_-W18§ = new ScrollPane();
         addChild(this.§_-W18§);
         this.§_-W18§.x = 0;
         this.§_-W18§.y = 5;
         this.§_-W18§.setSize(275,232);
         this.§_-51V§ = new Sprite();
         this.§_-51V§.addChild(this.§_-Bo§);
         this.§_-W18§.source = this.§_-51V§;
         this.§_-W18§.update();
      }
   }
}

