package §_-HG§
{
   import §_-Qy§.§_-U2K§;
   import §_-S1n§.§_-K1y§;
   import §_-S1n§.§_-kr§;
   import §_-X1k§.§_-HZ§;
   import §_-X1k§.§_-hO§;
   import §_-bN§.§_-Z1o§;
   import §_-c2C§.§_-t2c§;
   import §_-c2C§.§_-u24§;
   import §_-n1h§.Perk;
   import flash.display.DisplayObject;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import utils.§_-45§;
   import utils.§_-y1l§;
   
   public class §_-w2L§ extends Sprite
   {
      
      public var id:int = -1;
      
      protected var §_-k2U§:Boolean = false;
      
      protected var §_-t2j§:Boolean = false;
      
      protected var §_-k2X§:int = 0;
      
      protected var §_-oj§:§_-kr§ = null;
      
      protected var §_-Vi§:§_-45§ = null;
      
      protected var §_-P2K§:Perk = null;
      
      protected var §_-p1o§:§_-51v§;
      
      protected var button:SimpleButton = null;
      
      protected var §_-Ix§:String = "";
      
      public function §_-w2L§(param1:int)
      {
         super();
         this.id = param1;
         this.§_-oj§ = new §_-K1y§(this,190,"",false);
         this.button = this.§_-F18§();
         this.button.x = this.iconOffset.x;
         this.button.y = this.iconOffset.y;
         addChild(this.button);
         this.§_-p1o§ = this.§_-k2j§();
         this.cost = this.§_-bD§;
         addEventListener(MouseEvent.CLICK,this.§_-H1h§);
         addEventListener(MouseEvent.MOUSE_DOWN,this.§_-H2§);
      }
      
      public function get iconOffset() : Point
      {
         return new Point(0,0);
      }
      
      public function clone() : §_-w2L§
      {
         var _loc1_:§_-w2L§ = new §_-w2L§(this.id);
         _loc1_.hero = this.hero;
         return _loc1_;
      }
      
      protected function §_-F18§() : SimpleButton
      {
         var _loc1_:DisplayObject = new this.iconClass();
         var _loc2_:DisplayObject = new this.iconClass();
         _loc2_.filters = [§_-y1l§.§_-p1e§];
         var _loc3_:DisplayObject = new this.iconClass();
         _loc3_.filters = [§_-y1l§.§_-V1N§];
         return new SimpleButton(_loc1_,_loc2_,_loc3_);
      }
      
      public function get iconClass() : Class
      {
         return null;
      }
      
      public function get §_-bD§() : int
      {
         return §_-HZ§.skills.list[this.id].mana_cost;
      }
      
      protected function §_-H2§(param1:MouseEvent) : void
      {
         if(!(§_-t2c§.active is §_-u24§))
         {
            return;
         }
         §_-of§.startDragging(this,this.localToGlobal(new Point(param1.currentTarget.x - this.x,param1.currentTarget.y - this.y)));
      }
      
      public function get glow() : Boolean
      {
         return this.§_-k2U§;
      }
      
      public function set glow(param1:Boolean) : void
      {
         if(this.§_-k2U§ == param1)
         {
            return;
         }
         this.§_-k2U§ = param1;
         this.§_-ZU§();
      }
      
      public function get §_-F1Y§() : Boolean
      {
         return this.§_-t2j§;
      }
      
      public function set §_-F1Y§(param1:Boolean) : void
      {
         if(this.§_-t2j§ == param1)
         {
            return;
         }
         this.§_-t2j§ = param1;
         this.button.mouseEnabled = !param1;
         this.button.enabled = !param1;
         this.§_-ZU§();
      }
      
      public function get cost() : int
      {
         return this.§_-k2X§;
      }
      
      public function set cost(param1:int) : void
      {
         this.§_-k2X§ = param1;
         this.§_-p1o§.text = String(param1);
         this.§_-p1o§.visible = param1 > 0 && §_-t2c§.active is §_-u24§;
      }
      
      public function get hero() : Hero
      {
         if(this.§_-P2K§)
         {
            return this.§_-P2K§.hero;
         }
         return null;
      }
      
      public function get active() : Boolean
      {
         if(!this.§_-P2K§)
         {
            return false;
         }
         return this.§_-P2K§.active;
      }
      
      public function get available() : Boolean
      {
         if(!this.§_-P2K§)
         {
            return false;
         }
         return this.§_-P2K§.available;
      }
      
      public function set hero(param1:Hero) : void
      {
         this.§_-3M§(param1);
      }
      
      public function §_-M1o§(param1:String) : void
      {
         this.§_-Ix§ = param1;
         this.§_-A2n§();
      }
      
      public function §_-gE§() : void
      {
         this.§_-Ix§ = "";
         this.§_-A2n§();
      }
      
      public function §_-H1h§(param1:Event = null) : void
      {
         this.§_-c2w§();
      }
      
      public function §_-A2n§(param1:Event = null) : void
      {
         if(!this.§_-qp§())
         {
            return;
         }
         this.§_-b2z§();
         this.§_-oj§.setStatus(this.description);
         var _loc2_:Array = [];
         if(this.§_-Ix§ != "")
         {
            _loc2_.push(new §_-U2K§(this.§_-Ix§));
         }
         _loc2_.push(this.§_-p1o§);
         (this.§_-oj§ as §_-K1y§).§_-qL§(_loc2_);
      }
      
      protected function §_-k2j§() : §_-51v§
      {
         this.§_-p1o§ = new §_-51v§(ImageIconMana,0.7);
         this.§_-p1o§.x = 18;
         this.§_-p1o§.y = 39;
         return this.§_-p1o§;
      }
      
      protected function §_-c2w§() : Boolean
      {
         if(this.§_-F1Y§)
         {
            return false;
         }
         if(!this.§_-P2K§)
         {
            return false;
         }
         if(!(§_-t2c§.active is §_-u24§))
         {
            this.§_-P2K§.active = !this.§_-P2K§.active;
            return false;
         }
         return true;
      }
      
      public function get §_-42d§() : Boolean
      {
         return §_-hO§.§_-42d§(this.cost);
      }
      
      protected function §_-U2g§() : Boolean
      {
         if(!this.§_-42d§ && !this.§_-P2K§.active)
         {
            §_-Z1o§.show();
            return true;
         }
         return false;
      }
      
      protected function §_-3M§(param1:Hero) : Boolean
      {
         if(this.§_-P2K§)
         {
            this.§_-P2K§.removeEventListener(Perk.§_-E1b§,this.§_-A2n§);
         }
         if(param1)
         {
            return true;
         }
         this.§_-P2K§ = null;
         return false;
      }
      
      protected function §_-qp§() : Boolean
      {
         if(!this.§_-P2K§)
         {
            return false;
         }
         this.glow = this.§_-P2K§.active && this.§_-P2K§.available;
         this.§_-F1Y§ = !this.§_-P2K§.available;
         if(!this.§_-P2K§.hero)
         {
            this.hero = null;
         }
         return true;
      }
      
      protected function §_-B3N§() : void
      {
         this.§_-Vi§ = new §_-45§();
         this.§_-Vi§.start = 0;
         this.§_-Vi§.x = this.§_-Vi§.radius;
         this.§_-Vi§.y = this.§_-Vi§.radius;
         this.§_-Vi§.color = 16711680;
         this.§_-Vi§.alpha = 0.5;
         this.§_-Vi§.mouseEnabled = false;
         this.§_-Vi§.mouseChildren = false;
         addChild(this.§_-Vi§);
      }
      
      public function §_-R2x§() : §_-K1y§
      {
         return this.§_-oj§ as §_-K1y§;
      }
      
      protected function §_-ZU§() : void
      {
         var _loc1_:Array = [];
         if(this.glow)
         {
            _loc1_ = _loc1_.concat(§_-y1l§.§_-e1O§);
         }
         if(this.§_-F1Y§)
         {
            _loc1_ = _loc1_.concat(§_-y1l§.§_-Tk§);
         }
         this.button.filters = _loc1_;
      }
      
      protected function §_-b2z§() : void
      {
         if(!this.§_-P2K§ || this.§_-P2K§.§_-G27§ == 0 && this.§_-P2K§.§_-h1§ == 0 || !this.§_-P2K§.§_-K2E§)
         {
            this.§_-Vi§.end = 0;
            return;
         }
         var _loc1_:Number = Math.PI * 2;
         if(this.§_-P2K§.§_-h1§ > 0)
         {
            this.§_-Vi§.end = (this.§_-P2K§.activeTime - this.§_-P2K§.§_-h1§) / this.§_-P2K§.activeTime * _loc1_;
         }
         else
         {
            this.§_-Vi§.end = _loc1_ - (this.§_-P2K§.totalCooldown - this.§_-P2K§.§_-G27§) / this.§_-P2K§.totalCooldown * _loc1_;
         }
      }
      
      public function get description() : String
      {
         return "";
      }
   }
}

