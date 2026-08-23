package ratings
{
   import §_-X1k§.§_-82O§;
   import §_-X1k§.§_-93H§;
   import events.GameEvent;
   import flash.display.GradientType;
   import flash.filters.GlowFilter;
   import flash.geom.Matrix;
   import flash.text.TextFormat;
   import utils.§_-B1d§;
   
   public class §_-n7§ extends §_-qg§
   {
      
      private static const §_-f1j§:int = 100;
      
      private static const §_-v1t§:int = 15;
      
      private static const §_-61l§:int = 30;
      
      private static const §_-Wl§:int = 10;
      
      private static const §_-z1y§:Array = [gls("Лучших чемпионов\nпока нет...\n\nПокажи на что ты\nспособен! Ты можешь\nстать лучшей белкой!\nУ тебя есть все шансы!\nПродолжай играть!"),gls("Лучших кланов\nпока нет...\n\nПродолжайте играть, именно\nВаш клан может\nстать самым лучшим!")];
      
      private static const §_-kv§:Array = [RatingImageNoTop,RatingImageNoClan];
      
      protected static const §_-W2P§:TextFormat = new TextFormat(§_-i5§.§_-p1s§,20,16777215);
      
      protected static const §_-K2R§:TextFormat = new TextFormat(§_-i5§.§_-p1s§,14,16777215);
      
      protected static const §_-f1Z§:GlowFilter = new GlowFilter(6697728,1,4,4,16);
      
      protected static const §_-E19§:GlowFilter = new GlowFilter(1659998,1,4,4,16);
      
      private var §_-v0§:§_-i5§ = null;
      
      private var §_-JJ§:int = 0;
      
      public function §_-n7§(param1:int)
      {
         super(param1);
         this.§_-JJ§ = §_-61l§;
      }
      
      override protected function §_-Z1r§() : void
      {
         var _loc1_:LeagueTopTapeView = new LeagueTopTapeView();
         _loc1_.x = int((§_-Zy§.§_-21V§ - _loc1_.width) * 0.5);
         _loc1_.y = 5;
         addChild(_loc1_);
         var _loc2_:§_-i5§ = new §_-i5§(gls("Сезон закончится через:"),0,15,new TextFormat(null,14,542545,true));
         _loc2_.x = 695 - int(_loc2_.textWidth * 0.5);
         addChild(_loc2_);
         this.§_-v0§ = new §_-i5§("",0,33,§_-W2P§);
         this.§_-v0§.filters = [§_-E19§];
         addChild(this.§_-v0§);
         addChild(new §_-i5§(gls("Лига чемпионов"),160,15,§_-W2P§)).filters = [§_-f1Z§];
         addChild(new §_-i5§(gls("Лучшие из лучших"),160,40,§_-K2R§));
      }
      
      override protected function get imageClass() : Class
      {
         return §_-kv§[this.type];
      }
      
      override protected function get imageText() : String
      {
         return §_-z1y§[this.type];
      }
      
      override protected function §_-g22§() : void
      {
         var _loc1_:Matrix = new Matrix();
         _loc1_.createGradientBox(900,75,Math.PI * 0.5,0,0);
         this.graphics.beginGradientFill(GradientType.LINEAR,[14535087,16777215,14535087],[0.5,0.1,0.5],[0,100,255],_loc1_);
         this.graphics.drawRect(0,0,900,75);
         _loc1_.createGradientBox(900,460,Math.PI * 0.5,0,75);
         this.graphics.beginGradientFill(GradientType.LINEAR,[14535087,16777215,14535087],[0.5,0.1,0.5],[0,100,255],_loc1_);
         this.graphics.drawRect(0,75,900,460);
      }
      
      override protected function §_-m1c§() : void
      {
         this.§_-W18§.x = 25;
         this.§_-W18§.y = 90;
         this.§_-W18§.setSize(860,400);
         this.§_-W18§.graphics.beginFill(0,0.05);
         this.§_-W18§.graphics.drawRect(-2,-2,844,404);
      }
      
      override protected function listen() : void
      {
         §_-82O§.addEventListener(GameEvent.TOP_CHANGED,§_-w16§);
      }
      
      override protected function §_-T2p§(param1:GameEvent) : void
      {
         if(this.ids.indexOf(Game.selfId) != -1 || §_-82O§.§_-a15§(this.type) != §_-93H§.§_-B39§(this.type) - 1)
         {
            return;
         }
         §_-82O§.§_-Rd§(this.type);
      }
      
      override protected function §_-r2B§() : void
      {
      }
      
      override protected function get ids() : Array
      {
         return §_-82O§.§_-T1q§(this.type);
      }
      
      override protected function §_-SR§(param1:int) : §_-u2r§
      {
         var _loc2_:§_-u2r§ = new §_-oU§(this.type,param1);
         _loc2_.addEventListener(§_-u2r§.VALUE_CHANGE,§_-y2Z§);
         return _loc2_;
      }
      
      override protected function §_-ZU§() : void
      {
         super.§_-ZU§();
         this.§_-o2P§.visible = this.§_-o2P§.visible && this.ids.indexOf(Game.selfId) != -1;
      }
      
      override protected function get timeUpdate() : int
      {
         return §_-v1t§;
      }
      
      override protected function §_-62z§() : void
      {
         super.§_-62z§();
         this.§_-v0§.text = §_-B1d§.§_-g2n§(§_-82O§.§_-C1R§);
         this.§_-v0§.x = 695 - int(this.§_-v0§.textWidth * 0.5);
         if(!this.visible)
         {
            return;
         }
         if(this.ids.length != 0 && this.elements.length != 0)
         {
            if(this.ids.indexOf(Game.selfId) == -1)
            {
               if(this.elements[this.elements.length - 1].value <= §_-82O§.§_-PK§(this.type))
               {
                  §_-82O§.§_-Rd§(this.type);
                  this.§_-JJ§ = §_-61l§;
                  return;
               }
            }
            else if(this.elements.length == §_-f1j§ && this.elements[§_-f1j§ - 1].id == Game.selfId)
            {
               this.§_-JJ§ = Math.min(this.§_-JJ§,§_-Wl§);
            }
         }
         if(this.§_-JJ§ <= 0)
         {
            return;
         }
         --this.§_-JJ§;
         if(this.§_-JJ§ > 0)
         {
            return;
         }
         this.§_-JJ§ = §_-61l§;
         §_-82O§.§_-Rd§(this.type);
      }
      
      override public function set visible(param1:Boolean) : void
      {
         super.visible = param1;
         if(param1)
         {
            §_-82O§.§_-Rd§(this.type);
         }
      }
   }
}

