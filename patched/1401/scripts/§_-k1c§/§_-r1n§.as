package §_-k1c§
{
   import buttons.§_-j18§;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.StyleSheet;
   import flash.text.TextFormat;
   import protocol.Connection;
   import protocol.§_-h2B§;
   import utils.§_-xb§;
   
   public class §_-r1n§ extends Dialog
   {
      
      public static const §_-I2U§:String = ["body {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 14px;","color: #FEFE00;","}",".color0 {","color: #FFFFFF;","font-weight: bold;","}",".color1 {","color: #FF5A3A;","font-weight: bold;","}",".color2 {","color: #FFA800;","font-weight: bold;","}",".color3 {","color: #FFF12A;","font-weight: bold;","}",".color4 {","color: #FFC8FF;","font-weight: bold;","}",".color5 {","color: #66F2FF;","font-weight: bold;","}",".color6 {","color: #66A6FF;","font-weight: bold;","}",".color7 {","color: #EF66FF;","font-weight: bold;","}"].join("\n");
      
      private static var _instance:§_-r1n§ = null;
      
      private var color:int = 0;
      
      private var §_-gV§:§_-22V§ = null;
      
      private var §_-Ge§:Array = null;
      
      private var style:StyleSheet = null;
      
      public function §_-r1n§()
      {
         super(gls("Изменение цвета"));
         this.init();
      }
      
      public static function show(param1:MouseEvent = null) : void
      {
         if(!_instance)
         {
            _instance = new §_-r1n§();
         }
         _instance.show();
      }
      
      public static function hide() : void
      {
         if(!_instance)
         {
            return;
         }
         _instance.hide();
      }
      
      private function init() : void
      {
         this.style = new StyleSheet();
         this.style.parseCSS(§_-I2U§);
         addChild(new §_-22V§(gls("Выбери цвет для имени"),60,0,new TextFormat(null,14,0)));
         var _loc1_:PaletteView = new PaletteView();
         _loc1_.x = 5;
         _loc1_.y = 30;
         addChild(_loc1_);
         this.§_-Ge§ = [_loc1_.button0,_loc1_.button1,_loc1_.button2,_loc1_.button3,_loc1_.button4,_loc1_.button5,_loc1_.button6,_loc1_.button7];
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-Ge§.length)
         {
            (this.§_-Ge§[_loc2_] as SimpleButton).addEventListener(MouseEvent.CLICK,this.setColor);
            _loc2_++;
         }
         this.§_-gV§ = new §_-22V§("",5,165,this.style);
         var _loc3_:Sprite = new Sprite();
         _loc3_.graphics.beginFill(13056,0.18);
         _loc3_.graphics.drawRect(_loc1_.x,this.§_-gV§.y,_loc1_.width,20);
         addChild(_loc3_);
         addChild(this.§_-gV§);
         var _loc4_:§_-j18§ = new §_-j18§(gls("Ок"));
         _loc4_.x = 100;
         _loc4_.y = 190;
         _loc4_.addEventListener(MouseEvent.CLICK,this.§_-P2v§);
         addChild(_loc4_);
         place();
         this.height += 40;
      }
      
      private function §_-P2v§(param1:MouseEvent) : void
      {
         Game.self["vip_color"] = this.color;
         Connection.§_-Li§(§_-h2B§.§_-q29§,this.color);
         hide();
      }
      
      private function setColor(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-Ge§.length)
         {
            if(param1.currentTarget == this.§_-Ge§[_loc2_])
            {
               this.color = _loc2_;
               break;
            }
            _loc2_++;
         }
         this.update();
      }
      
      private function update() : void
      {
         this.§_-gV§.text = gls("<body>{0} текст сообщения.</body>",§_-xb§.span(Game.self.name + ":","color" + this.color));
      }
      
      override public function show() : void
      {
         super.show();
         this.color = Game.self["vip_color"];
         this.update();
      }
   }
}

