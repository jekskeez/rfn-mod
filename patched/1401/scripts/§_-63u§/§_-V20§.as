package §_-63u§
{
   import §_-5C§.ListDataEvent;
   import §_-Kr§.ScrollPane;
   import §_-X1o§.§_-ZT§;
   import flash.display.Sprite;
   import views.§_-BR§;
   import views.§_-TP§;
   
   public class §_-V20§ extends §_-31r§
   {
      
      public function §_-V20§()
      {
         super(null);
      }
      
      override public function show() : void
      {
         super.show();
         this.§_-O2e§.visible = false;
         this.placeOnResize();
         this.§_-HH§.x = (this.width - this.§_-HH§.width) * 0.5 - 10;
         this.§_-HH§.y = this.height - 76;
         addChild(this.§_-HH§);
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
         this.§_-R1Y§ = 15;
         this.§_-4n§ = 20;
         this.topOffset = 10;
         this.§_-JZ§ = 0;
      }
      
      override protected function init(param1:Class) : void
      {
         var _loc2_:int = 340;
         this.§_-Q2G§ = true;
         this.drawBackground = true;
         this.caption = gls("Результаты раунда");
         place();
         this.width = 300;
         this.height = _loc2_;
         this.§_-Q1H§ = new Sprite();
         this.§_-Q1H§.y = this.height - 20;
         this.§_-HH§ = §_-BR§.instance;
         this.§_-w2T§ = new §_-TP§();
         this.§_-w2T§.addEventListener(ListDataEvent.SORTED,§_-l2F§);
         this.§_-N19§ = new §_-ZT§();
         this.§_-N19§.x = 0;
         this.§_-N19§.y = 0;
         this.§_-N19§.setData(this.§_-w2T§);
         this.§_-M1N§ = new ScrollPane();
         addChild(this.§_-M1N§);
         this.§_-M1N§.x = 0;
         this.§_-M1N§.y = 5;
         this.§_-M1N§.setSize(275,232);
         this.§_-Lv§ = new Sprite();
         this.§_-Lv§.addChild(this.§_-N19§);
         this.§_-M1N§.source = this.§_-Lv§;
         this.§_-M1N§.update();
      }
   }
}

