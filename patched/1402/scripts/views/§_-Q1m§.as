package views
{
   import §_-S1n§.§_-02M§;
   import §_-S1n§.§_-kr§;
   import §_-U19§.§_-B2U§;
   import §_-U19§.§_-su§;
   import events.§_-52x§;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.filters.DropShadowFilter;
   import flash.text.StyleSheet;
   import flash.text.TextFormat;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   import utils.§_-u1G§;
   
   public class §_-Q1m§ extends Sprite
   {
      
      private static const §_-aD§:String = ["body {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 12px;","color: #000000;","}",".bold {","font-weight: bold;","}"].join("\n");
      
      private var style:StyleSheet = new StyleSheet();
      
      private var §_-n2x§:int = -1;
      
      private var §_-y2h§:§_-i5§ = null;
      
      private var §_-IK§:Timer = null;
      
      private var §_-W2j§:TotemBuy = null;
      
      private var §_-y2c§:TotemPlaceBlock = null;
      
      private var §_-uG§:DisplayObject = null;
      
      private var §_-03B§:§_-u1G§ = null;
      
      private var §_-X1r§:§_-kr§ = null;
      
      private var §_-D2v§:§_-kr§ = null;
      
      private var §_-F1w§:§_-kr§ = null;
      
      private var §_-A3q§:int = 0;
      
      private var number:int = 0;
      
      private var §_-pj§:int = 0;
      
      private var §_-O1D§:Boolean = false;
      
      public function §_-Q1m§(param1:int)
      {
         super();
         this.number = param1;
         this.init();
      }
      
      public function §_-ZK§() : void
      {
         this.§_-y2c§.visible = false;
         this.§_-W2j§.visible = true;
      }
      
      public function §_-lh§() : void
      {
         this.id = §_-su§.NONE;
         this.expires = 0;
         this.§_-y2c§.visible = true;
         this.§_-W2j§.visible = false;
      }
      
      public function get id() : int
      {
         return this.§_-n2x§;
      }
      
      public function set id(param1:int) : void
      {
         if(param1 != §_-su§.NONE && this.§_-73o§ <= 0 && !this.§_-O1D§)
         {
            §_-B2U§.request(Game.self["clan_id"],§_-eT§.§_-t1d§,true);
            return;
         }
         if(this.§_-n2x§ == param1)
         {
            return;
         }
         this.§_-n2x§ = param1;
         this.§_-W2j§.visible = this.§_-n2x§ == §_-su§.NONE;
         this.§_-03B§.visible = this.§_-W2j§.visible;
         if(Boolean(this.§_-uG§) && Boolean(this.§_-uG§.parent))
         {
            this.§_-uG§.removeEventListener(MouseEvent.CLICK,this.§_-N5§);
            this.§_-uG§.parent.removeChild(this.§_-uG§);
         }
         if(this.§_-W2j§.visible)
         {
            if(this.§_-73o§ > 0)
            {
               this.§_-p2s§(gls("Поставить тотем"));
            }
            else
            {
               this.§_-p2s§(gls("Купить место для тотема на 24 часа"));
            }
            return;
         }
         this.§_-uG§ = §_-su§.§_-e14§(this.id);
         this.§_-uG§.addEventListener(MouseEvent.CLICK,this.§_-N5§);
         this.§_-uG§.scaleX = this.§_-uG§.scaleY = this.§_-O1D§ ? 1 : 0.7;
         this.§_-uG§.y = this.§_-O1D§ ? 10 : 10 + this.§_-uG§.height * 0.4;
         this.§_-uG§.x = this.§_-O1D§ ? 0 : this.§_-uG§.width * 0.15;
         addChildAt(this.§_-uG§,0);
      }
      
      public function §_-p1M§(param1:int) : void
      {
         new §_-kr§(this.§_-y2c§,gls("Требуется {0} уровень клана",param1));
      }
      
      public function §_-eV§(param1:int, param2:int, param3:int) : void
      {
         this.§_-03B§.visible = true;
         this.§_-03B§.setExperience(param1,param2,param3);
         if(this.§_-X1r§ != null)
         {
            this.§_-X1r§.remove();
         }
         this.§_-y2c§.visible = false;
         this.§_-W2j§.visible = false;
         this.§_-X1r§ = new §_-02M§(this.§_-03B§,§_-su§.§_-P1j§(this.id),this.id,param1,param2,param3);
      }
      
      public function set bonus(param1:int) : void
      {
         this.§_-pj§ = param1;
         if(!this.§_-uG§)
         {
            return;
         }
         if(this.§_-F1w§ != null)
         {
            this.§_-F1w§.remove();
         }
         this.§_-F1w§ = new §_-kr§(this.§_-uG§,"<body><span class = \'bold\'>" + §_-su§.getName(this.id) + "</span>\n" + §_-su§.§_-ya§(this.id,this.§_-pj§) + "</body>");
         this.§_-F1w§.setStyle(this.style);
      }
      
      public function set expires(param1:int) : void
      {
         this.§_-A3q§ = param1;
         this.§_-y2c§.visible = false;
         this.§_-W2j§.visible = true;
         this.§_-y2h§.visible = this.§_-O1D§ ? false : this.§_-73o§ > 0;
         if(this.§_-O1D§)
         {
            return;
         }
         if(this.§_-73o§ <= 0)
         {
            if(this.§_-IK§)
            {
               this.§_-IK§.stop();
               this.§_-IK§.removeEventListener(TimerEvent.TIMER,this.§_-62z§);
               this.§_-IK§ = null;
            }
            this.§_-p2s§(gls("Купить место для тотема на 24 часа"));
            return;
         }
         if(!this.§_-IK§)
         {
            this.§_-IK§ = new Timer(1000);
            this.§_-IK§.addEventListener(TimerEvent.TIMER,this.§_-62z§);
            this.§_-IK§.start();
         }
         this.§_-p2s§(gls("Поставить тотем"));
         this.§_-62z§();
      }
      
      private function init() : void
      {
         this.style.parseCSS(§_-aD§);
         this.§_-O1D§ = this.number == 0;
         this.§_-y2c§ = new TotemPlaceBlock();
         this.§_-y2c§.scaleX = this.§_-y2c§.scaleY = this.§_-O1D§ ? 1 : 0.7;
         this.§_-y2c§.y = this.§_-O1D§ ? 10 : 10 + this.§_-y2c§.height * 0.4;
         this.§_-y2c§.x = this.§_-O1D§ ? 0 : this.§_-y2c§.width * 0.15;
         addChild(this.§_-y2c§);
         this.§_-W2j§ = new TotemBuy();
         this.§_-W2j§.visible = false;
         this.§_-W2j§.scaleX = this.§_-W2j§.scaleY = this.§_-O1D§ ? 1 : 0.7;
         this.§_-W2j§.y = this.§_-O1D§ ? 10 : 10 + this.§_-W2j§.height * 0.4;
         this.§_-W2j§.x = this.§_-O1D§ ? 0 : this.§_-W2j§.width * 0.15;
         this.§_-W2j§.addEventListener(MouseEvent.CLICK,this.§_-y2M§);
         this.§_-p2s§(gls("Купить место для тотема на 24 часа"));
         addChild(this.§_-W2j§);
         this.§_-03B§ = new §_-u1G§(84);
         this.§_-03B§.x = 10;
         this.§_-03B§.y = 227;
         this.§_-03B§.visible = false;
         addChild(this.§_-03B§);
         var _loc1_:TextFormat = new TextFormat(null,12,16115559,true);
         this.§_-y2h§ = new §_-i5§("",30,210,_loc1_);
         this.§_-y2h§.filters = [new DropShadowFilter(0,45,0,1,3,3,4.2)];
         this.§_-y2h§.visible = false;
         addChild(this.§_-y2h§);
      }
      
      private function §_-p2s§(param1:String) : void
      {
         if(this.§_-D2v§ != null)
         {
            this.§_-D2v§.remove();
         }
         this.§_-D2v§ = new §_-kr§(this.§_-W2j§,param1);
      }
      
      private function §_-62z§(param1:TimerEvent = null) : void
      {
         this.§_-y2h§.text = new Date(0,0,0,0,0,this.§_-73o§).toTimeString().slice(0,8);
         if(this.§_-73o§ < 0)
         {
            §_-B2U§.request(Game.self["clan_id"],§_-eT§.§_-t1d§,true);
         }
      }
      
      private function get §_-73o§() : int
      {
         return this.§_-A3q§ - getTimer() / 1000;
      }
      
      private function §_-y2M§(param1:MouseEvent) : void
      {
         if(this.§_-73o§ <= 0 && !this.§_-O1D§)
         {
            dispatchEvent(new §_-52x§(§_-52x§.§_-o2f§,this.number));
         }
         else if(this.§_-73o§ > 0 || this.§_-O1D§)
         {
            dispatchEvent(new §_-52x§(§_-52x§.§_-825§,this.number));
         }
      }
      
      private function §_-N5§(param1:MouseEvent) : void
      {
         dispatchEvent(new §_-52x§(§_-52x§.§_-825§,this.number));
      }
   }
}

