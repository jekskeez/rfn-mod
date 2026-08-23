package views
{
   import §_-dc§.§_-d1q§;
   import §_-dc§.§_-e2W§;
   import §_-e1G§.§_-Hb§;
   import §_-e1G§.§_-T2R§;
   import events.§_-E2i§;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.filters.DropShadowFilter;
   import flash.text.StyleSheet;
   import flash.text.TextFormat;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   import utils.§_-d1e§;
   
   public class §_-K13§ extends Sprite
   {
      
      private static const §_-I2U§:String = ["body {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 12px;","color: #000000;","}",".bold {","font-weight: bold;","}"].join("\n");
      
      private var style:StyleSheet = new StyleSheet();
      
      private var §_-4A§:int = -1;
      
      private var §_-P1v§:§_-22V§ = null;
      
      private var §_-Vp§:Timer = null;
      
      private var §_-03r§:TotemBuy = null;
      
      private var §_-u2P§:TotemPlaceBlock = null;
      
      private var §_-fz§:DisplayObject = null;
      
      private var §_-62U§:§_-d1e§ = null;
      
      private var §_-G1I§:§_-Hb§ = null;
      
      private var §_-ks§:§_-Hb§ = null;
      
      private var §_-l2b§:§_-Hb§ = null;
      
      private var §_-432§:int = 0;
      
      private var number:int = 0;
      
      private var §_-iA§:int = 0;
      
      private var §_-t1D§:Boolean = false;
      
      public function §_-K13§(param1:int)
      {
         super();
         this.number = param1;
         this.init();
      }
      
      public function §_-1l§() : void
      {
         this.§_-u2P§.visible = false;
         this.§_-03r§.visible = true;
      }
      
      public function §_-o4§() : void
      {
         this.id = §_-d1q§.NONE;
         this.expires = 0;
         this.§_-u2P§.visible = true;
         this.§_-03r§.visible = false;
      }
      
      public function get id() : int
      {
         return this.§_-4A§;
      }
      
      public function set id(param1:int) : void
      {
         if(param1 != §_-d1q§.NONE && this.§_-Gr§ <= 0 && !this.§_-t1D§)
         {
            §_-e2W§.request(Game.self["clan_id"],§_-Oy§.§_-TZ§,true);
            return;
         }
         if(this.§_-4A§ == param1)
         {
            return;
         }
         this.§_-4A§ = param1;
         this.§_-03r§.visible = this.§_-4A§ == §_-d1q§.NONE;
         this.§_-62U§.visible = this.§_-03r§.visible;
         if(Boolean(this.§_-fz§) && Boolean(this.§_-fz§.parent))
         {
            this.§_-fz§.removeEventListener(MouseEvent.CLICK,this.§_-RF§);
            this.§_-fz§.parent.removeChild(this.§_-fz§);
         }
         if(this.§_-03r§.visible)
         {
            if(this.§_-Gr§ > 0)
            {
               this.§_-A2S§(gls("Поставить тотем"));
            }
            else
            {
               this.§_-A2S§(gls("Купить место для тотема на 24 часа"));
            }
            return;
         }
         this.§_-fz§ = §_-d1q§.§_-81e§(this.id);
         this.§_-fz§.addEventListener(MouseEvent.CLICK,this.§_-RF§);
         this.§_-fz§.scaleX = this.§_-fz§.scaleY = this.§_-t1D§ ? 1 : 0.7;
         this.§_-fz§.y = this.§_-t1D§ ? 10 : 10 + this.§_-fz§.height * 0.4;
         this.§_-fz§.x = this.§_-t1D§ ? 0 : this.§_-fz§.width * 0.15;
         addChildAt(this.§_-fz§,0);
      }
      
      public function §_-D1v§(param1:int) : void
      {
         new §_-Hb§(this.§_-u2P§,gls("Требуется {0} уровень клана",param1));
      }
      
      public function §_-a2t§(param1:int, param2:int, param3:int) : void
      {
         this.§_-62U§.visible = true;
         this.§_-62U§.setExperience(param1,param2,param3);
         if(this.§_-G1I§ != null)
         {
            this.§_-G1I§.remove();
         }
         this.§_-u2P§.visible = false;
         this.§_-03r§.visible = false;
         this.§_-G1I§ = new §_-T2R§(this.§_-62U§,§_-d1q§.§_-Oq§(this.id),this.id,param1,param2,param3);
      }
      
      public function set bonus(param1:int) : void
      {
         this.§_-iA§ = param1;
         if(!this.§_-fz§)
         {
            return;
         }
         if(this.§_-l2b§ != null)
         {
            this.§_-l2b§.remove();
         }
         this.§_-l2b§ = new §_-Hb§(this.§_-fz§,"<body><span class = \'bold\'>" + §_-d1q§.getName(this.id) + "</span>\n" + §_-d1q§.§_-l7§(this.id,this.§_-iA§) + "</body>");
         this.§_-l2b§.setStyle(this.style);
      }
      
      public function set expires(param1:int) : void
      {
         this.§_-432§ = param1;
         this.§_-u2P§.visible = false;
         this.§_-03r§.visible = true;
         this.§_-P1v§.visible = this.§_-t1D§ ? false : this.§_-Gr§ > 0;
         if(this.§_-t1D§)
         {
            return;
         }
         if(this.§_-Gr§ <= 0)
         {
            if(this.§_-Vp§)
            {
               this.§_-Vp§.stop();
               this.§_-Vp§.removeEventListener(TimerEvent.TIMER,this.§_-A1b§);
               this.§_-Vp§ = null;
            }
            this.§_-A2S§(gls("Купить место для тотема на 24 часа"));
            return;
         }
         if(!this.§_-Vp§)
         {
            this.§_-Vp§ = new Timer(1000);
            this.§_-Vp§.addEventListener(TimerEvent.TIMER,this.§_-A1b§);
            this.§_-Vp§.start();
         }
         this.§_-A2S§(gls("Поставить тотем"));
         this.§_-A1b§();
      }
      
      private function init() : void
      {
         this.style.parseCSS(§_-I2U§);
         this.§_-t1D§ = this.number == 0;
         this.§_-u2P§ = new TotemPlaceBlock();
         this.§_-u2P§.scaleX = this.§_-u2P§.scaleY = this.§_-t1D§ ? 1 : 0.7;
         this.§_-u2P§.y = this.§_-t1D§ ? 10 : 10 + this.§_-u2P§.height * 0.4;
         this.§_-u2P§.x = this.§_-t1D§ ? 0 : this.§_-u2P§.width * 0.15;
         addChild(this.§_-u2P§);
         this.§_-03r§ = new TotemBuy();
         this.§_-03r§.visible = false;
         this.§_-03r§.scaleX = this.§_-03r§.scaleY = this.§_-t1D§ ? 1 : 0.7;
         this.§_-03r§.y = this.§_-t1D§ ? 10 : 10 + this.§_-03r§.height * 0.4;
         this.§_-03r§.x = this.§_-t1D§ ? 0 : this.§_-03r§.width * 0.15;
         this.§_-03r§.addEventListener(MouseEvent.CLICK,this.§_-a2M§);
         this.§_-A2S§(gls("Купить место для тотема на 24 часа"));
         addChild(this.§_-03r§);
         this.§_-62U§ = new §_-d1e§(84);
         this.§_-62U§.x = 10;
         this.§_-62U§.y = 227;
         this.§_-62U§.visible = false;
         addChild(this.§_-62U§);
         var _loc1_:TextFormat = new TextFormat(null,12,16115559,true);
         this.§_-P1v§ = new §_-22V§("",30,210,_loc1_);
         this.§_-P1v§.filters = [new DropShadowFilter(0,45,0,1,3,3,4.2)];
         this.§_-P1v§.visible = false;
         addChild(this.§_-P1v§);
      }
      
      private function §_-A2S§(param1:String) : void
      {
         if(this.§_-ks§ != null)
         {
            this.§_-ks§.remove();
         }
         this.§_-ks§ = new §_-Hb§(this.§_-03r§,param1);
      }
      
      private function §_-A1b§(param1:TimerEvent = null) : void
      {
         this.§_-P1v§.text = new Date(0,0,0,0,0,this.§_-Gr§).toTimeString().slice(0,8);
         if(this.§_-Gr§ < 0)
         {
            §_-e2W§.request(Game.self["clan_id"],§_-Oy§.§_-TZ§,true);
         }
      }
      
      private function get §_-Gr§() : int
      {
         return this.§_-432§ - getTimer() / 1000;
      }
      
      private function §_-a2M§(param1:MouseEvent) : void
      {
         if(this.§_-Gr§ <= 0 && !this.§_-t1D§)
         {
            dispatchEvent(new §_-E2i§(§_-E2i§.§_-52B§,this.number));
         }
         else if(this.§_-Gr§ > 0 || this.§_-t1D§)
         {
            dispatchEvent(new §_-E2i§(§_-E2i§.§_-hS§,this.number));
         }
      }
      
      private function §_-RF§(param1:MouseEvent) : void
      {
         dispatchEvent(new §_-E2i§(§_-E2i§.§_-hS§,this.number));
      }
   }
}

