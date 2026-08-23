package ratings
{
   import §_-I10§.§_-13r§;
   import §_-I10§.§_-8S§;
   import events.GameEvent;
   import flash.display.GradientType;
   import flash.filters.GlowFilter;
   import flash.geom.Matrix;
   import flash.text.TextFormat;
   import utils.§_-ex§;
   
   public class §_-633§ extends §_-t2m§
   {
      
      private static const §_-e2Z§:int = 100;
      
      private static const §_-gb§:int = 15;
      
      private static const §_-m14§:int = 30;
      
      private static const §_-r1V§:int = 10;
      
      private static const §_-l19§:Array = [gls("Лучших чемпионов\nпока нет...\n\nПокажи на что ты\nспособен! Ты можешь\nстать лучшей белкой!\nУ тебя есть все шансы!\nПродолжай играть!"),gls("Лучших кланов\nпока нет...\n\nПродолжайте играть, именно\nВаш клан может\nстать самым лучшим!")];
      
      private static const §_-b1S§:Array = [RatingImageNoTop,RatingImageNoClan];
      
      protected static const §_-i2c§:TextFormat = new TextFormat(§_-22V§.§_-pJ§,20,16777215);
      
      protected static const §_-JQ§:TextFormat = new TextFormat(§_-22V§.§_-pJ§,14,16777215);
      
      protected static const §_-j5§:GlowFilter = new GlowFilter(6697728,1,4,4,16);
      
      protected static const §_-Kw§:GlowFilter = new GlowFilter(1659998,1,4,4,16);
      
      private var §_-gB§:§_-22V§ = null;
      
      private var §_-yj§:int = 0;
      
      public function §_-633§(param1:int)
      {
         super(param1);
         this.§_-yj§ = §_-m14§;
      }
      
      override protected function §_-036§() : void
      {
         var _loc1_:LeagueTopTapeView = new LeagueTopTapeView();
         _loc1_.x = int((§_-a9§.§_-9o§ - _loc1_.width) * 0.5);
         _loc1_.y = 5;
         addChild(_loc1_);
         var _loc2_:§_-22V§ = new §_-22V§(gls("Сезон закончится через:"),0,15,new TextFormat(null,14,542545,true));
         _loc2_.x = 695 - int(_loc2_.textWidth * 0.5);
         addChild(_loc2_);
         this.§_-gB§ = new §_-22V§("",0,33,§_-i2c§);
         this.§_-gB§.filters = [§_-Kw§];
         addChild(this.§_-gB§);
         addChild(new §_-22V§(gls("Лига чемпионов"),160,15,§_-i2c§)).filters = [§_-j5§];
         addChild(new §_-22V§(gls("Лучшие из лучших"),160,40,§_-JQ§));
      }
      
      override protected function get imageClass() : Class
      {
         return §_-b1S§[this.type];
      }
      
      override protected function get imageText() : String
      {
         return §_-l19§[this.type];
      }
      
      override protected function §_-s2A§() : void
      {
         var _loc1_:Matrix = new Matrix();
         _loc1_.createGradientBox(900,75,Math.PI * 0.5,0,0);
         this.graphics.beginGradientFill(GradientType.LINEAR,[14535087,16777215,14535087],[0.5,0.1,0.5],[0,100,255],_loc1_);
         this.graphics.drawRect(0,0,900,75);
         _loc1_.createGradientBox(900,460,Math.PI * 0.5,0,75);
         this.graphics.beginGradientFill(GradientType.LINEAR,[14535087,16777215,14535087],[0.5,0.1,0.5],[0,100,255],_loc1_);
         this.graphics.drawRect(0,75,900,460);
      }
      
      override protected function §_-V1H§() : void
      {
         this.§_-M1N§.x = 25;
         this.§_-M1N§.y = 90;
         this.§_-M1N§.setSize(860,400);
         this.§_-M1N§.graphics.beginFill(0,0.05);
         this.§_-M1N§.graphics.drawRect(-2,-2,844,404);
      }
      
      override protected function listen() : void
      {
         §_-13r§.addEventListener(GameEvent.TOP_CHANGED,§_-vM§);
      }
      
      override protected function §_-21H§(param1:GameEvent) : void
      {
         if(this.ids.indexOf(Game.selfId) != -1 || §_-13r§.§_-DX§(this.type) != §_-8S§.§_-Oh§(this.type) - 1)
         {
            return;
         }
         §_-13r§.§_-Y1D§(this.type);
      }
      
      override protected function §_-y2i§() : void
      {
      }
      
      override protected function get ids() : Array
      {
         return §_-13r§.§_-C3F§(this.type);
      }
      
      override protected function §_-F13§(param1:int) : §_-f1T§
      {
         var _loc2_:§_-f1T§ = new §_-51§(this.type,param1);
         _loc2_.addEventListener(§_-f1T§.VALUE_CHANGE,§_-q2K§);
         return _loc2_;
      }
      
      override protected function §_-l13§() : void
      {
         super.§_-l13§();
         this.§_-S2T§.visible = this.§_-S2T§.visible && this.ids.indexOf(Game.selfId) != -1;
      }
      
      override protected function get timeUpdate() : int
      {
         return §_-gb§;
      }
      
      override protected function §_-A1b§() : void
      {
         super.§_-A1b§();
         this.§_-gB§.text = §_-ex§.§_-d2X§(§_-13r§.§_-c1h§);
         this.§_-gB§.x = 695 - int(this.§_-gB§.textWidth * 0.5);
         if(!this.visible)
         {
            return;
         }
         if(this.ids.length != 0 && this.elements.length != 0)
         {
            if(this.ids.indexOf(Game.selfId) == -1)
            {
               if(this.elements[this.elements.length - 1].value <= §_-13r§.§_-4G§(this.type))
               {
                  §_-13r§.§_-Y1D§(this.type);
                  this.§_-yj§ = §_-m14§;
                  return;
               }
            }
            else if(this.elements.length == §_-e2Z§ && this.elements[§_-e2Z§ - 1].id == Game.selfId)
            {
               this.§_-yj§ = Math.min(this.§_-yj§,§_-r1V§);
            }
         }
         if(this.§_-yj§ <= 0)
         {
            return;
         }
         --this.§_-yj§;
         if(this.§_-yj§ > 0)
         {
            return;
         }
         this.§_-yj§ = §_-m14§;
         §_-13r§.§_-Y1D§(this.type);
      }
      
      override public function set visible(param1:Boolean) : void
      {
         super.visible = param1;
         if(param1)
         {
            §_-13r§.§_-Y1D§(this.type);
         }
      }
   }
}

