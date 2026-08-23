package §_-92M§
{
   import §_-I10§.§_-Z1F§;
   import §_-I10§.§_-t2V§;
   import §_-S2§.Perk;
   import §_-T2y§.§_-71o§;
   import §_-T2y§.§_-92z§;
   import §_-d10§.§_-02M§;
   import §_-e1G§.§_-Hb§;
   import §_-e1G§.§_-N2L§;
   import §_-k1c§.§_-92s§;
   import flash.display.DisplayObject;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import utils.§_-AR§;
   import utils.§_-x1Z§;
   
   public class §_-X2z§ extends Sprite
   {
      
      public var id:int = -1;
      
      protected var §_-h1H§:Boolean = false;
      
      protected var §_-P3§:Boolean = false;
      
      protected var §_-U2r§:int = 0;
      
      protected var §_-XW§:§_-Hb§ = null;
      
      protected var §_-vR§:§_-AR§ = null;
      
      protected var §_-425§:Perk = null;
      
      protected var §_-M22§:§_-01u§;
      
      protected var button:SimpleButton = null;
      
      protected var §_-I2J§:String = "";
      
      public function §_-X2z§(param1:int)
      {
         super();
         this.id = param1;
         this.§_-XW§ = new §_-N2L§(this,190,"",false);
         this.button = this.§_-Tb§();
         this.button.x = this.iconOffset.x;
         this.button.y = this.iconOffset.y;
         addChild(this.button);
         this.§_-M22§ = this.§_-y2l§();
         this.cost = this.§_-Ll§;
         addEventListener(MouseEvent.CLICK,this.§_-P2v§);
         addEventListener(MouseEvent.MOUSE_DOWN,this.§_-53X§);
      }
      
      public function get iconOffset() : Point
      {
         return new Point(0,0);
      }
      
      public function clone() : §_-X2z§
      {
         var _loc1_:§_-X2z§ = new §_-X2z§(this.id);
         _loc1_.hero = this.hero;
         return _loc1_;
      }
      
      protected function §_-Tb§() : SimpleButton
      {
         var _loc1_:DisplayObject = new this.iconClass();
         var _loc2_:DisplayObject = new this.iconClass();
         _loc2_.filters = [§_-x1Z§.§_-w1t§];
         var _loc3_:DisplayObject = new this.iconClass();
         _loc3_.filters = [§_-x1Z§.§_-H23§];
         return new SimpleButton(_loc1_,_loc2_,_loc3_);
      }
      
      public function get iconClass() : Class
      {
         return null;
      }
      
      public function get §_-Ll§() : int
      {
         return §_-t2V§.skills.list[this.id].mana_cost;
      }
      
      protected function §_-53X§(param1:MouseEvent) : void
      {
         if(!(§_-71o§.active is §_-92z§))
         {
            return;
         }
         §_-U1r§.startDragging(this,this.localToGlobal(new Point(param1.currentTarget.x - this.x,param1.currentTarget.y - this.y)));
      }
      
      public function get glow() : Boolean
      {
         return this.§_-h1H§;
      }
      
      public function set glow(param1:Boolean) : void
      {
         if(this.§_-h1H§ == param1)
         {
            return;
         }
         this.§_-h1H§ = param1;
         this.§_-l13§();
      }
      
      public function get §_-3Q§() : Boolean
      {
         return this.§_-P3§;
      }
      
      public function set §_-3Q§(param1:Boolean) : void
      {
         if(this.§_-P3§ == param1)
         {
            return;
         }
         this.§_-P3§ = param1;
         this.button.mouseEnabled = !param1;
         this.button.enabled = !param1;
         this.§_-l13§();
      }
      
      public function get cost() : int
      {
         return this.§_-U2r§;
      }
      
      public function set cost(param1:int) : void
      {
         this.§_-U2r§ = param1;
         this.§_-M22§.text = String(param1);
         this.§_-M22§.visible = param1 > 0 && §_-71o§.active is §_-92z§;
      }
      
      public function get hero() : Hero
      {
         if(this.§_-425§)
         {
            return this.§_-425§.hero;
         }
         return null;
      }
      
      public function get active() : Boolean
      {
         if(!this.§_-425§)
         {
            return false;
         }
         return this.§_-425§.active;
      }
      
      public function get available() : Boolean
      {
         if(!this.§_-425§)
         {
            return false;
         }
         return this.§_-425§.available;
      }
      
      public function set hero(param1:Hero) : void
      {
         this.§_-qu§(param1);
      }
      
      public function §_-ci§(param1:String) : void
      {
         this.§_-I2J§ = param1;
         this.§_-Dh§();
      }
      
      public function §_-Yf§() : void
      {
         this.§_-I2J§ = "";
         this.§_-Dh§();
      }
      
      public function §_-P2v§(param1:Event = null) : void
      {
         this.§_-K2G§();
      }
      
      public function §_-Dh§(param1:Event = null) : void
      {
         if(!this.§_-A3c§())
         {
            return;
         }
         this.§_-bZ§();
         this.§_-XW§.setStatus(this.description);
         var _loc2_:Array = [];
         if(this.§_-I2J§ != "")
         {
            _loc2_.push(new §_-02M§(this.§_-I2J§));
         }
         _loc2_.push(this.§_-M22§);
         (this.§_-XW§ as §_-N2L§).§_-b2m§(_loc2_);
      }
      
      protected function §_-y2l§() : §_-01u§
      {
         this.§_-M22§ = new §_-01u§(ImageIconMana,0.7);
         this.§_-M22§.x = 18;
         this.§_-M22§.y = 39;
         return this.§_-M22§;
      }
      
      protected function §_-K2G§() : Boolean
      {
         if(this.§_-3Q§)
         {
            return false;
         }
         if(!this.§_-425§)
         {
            return false;
         }
         if(!(§_-71o§.active is §_-92z§))
         {
            this.§_-425§.active = !this.§_-425§.active;
            return false;
         }
         return true;
      }
      
      public function get §_-k1w§() : Boolean
      {
         return §_-Z1F§.§_-k1w§(this.cost);
      }
      
      protected function §_-41x§() : Boolean
      {
         if(!this.§_-k1w§ && !this.§_-425§.active)
         {
            §_-92s§.show();
            return true;
         }
         return false;
      }
      
      protected function §_-qu§(param1:Hero) : Boolean
      {
         if(this.§_-425§)
         {
            this.§_-425§.removeEventListener(Perk.§_-RK§,this.§_-Dh§);
         }
         if(param1)
         {
            return true;
         }
         this.§_-425§ = null;
         return false;
      }
      
      protected function §_-A3c§() : Boolean
      {
         if(!this.§_-425§)
         {
            return false;
         }
         this.glow = this.§_-425§.active && this.§_-425§.available;
         this.§_-3Q§ = !this.§_-425§.available;
         if(!this.§_-425§.hero)
         {
            this.hero = null;
         }
         return true;
      }
      
      protected function §_-w7§() : void
      {
         this.§_-vR§ = new §_-AR§();
         this.§_-vR§.start = 0;
         this.§_-vR§.x = this.§_-vR§.radius;
         this.§_-vR§.y = this.§_-vR§.radius;
         this.§_-vR§.color = 16711680;
         this.§_-vR§.alpha = 0.5;
         this.§_-vR§.mouseEnabled = false;
         this.§_-vR§.mouseChildren = false;
         addChild(this.§_-vR§);
      }
      
      public function §_-Z15§() : §_-N2L§
      {
         return this.§_-XW§ as §_-N2L§;
      }
      
      protected function §_-l13§() : void
      {
         var _loc1_:Array = [];
         if(this.glow)
         {
            _loc1_ = _loc1_.concat(§_-x1Z§.§_-k1X§);
         }
         if(this.§_-3Q§)
         {
            _loc1_ = _loc1_.concat(§_-x1Z§.§_-c2G§);
         }
         this.button.filters = _loc1_;
      }
      
      protected function §_-bZ§() : void
      {
         if(!this.§_-425§ || this.§_-425§.§_-3V§ == 0 && this.§_-425§.§_-f1z§ == 0 || !this.§_-425§.§_-01h§)
         {
            this.§_-vR§.end = 0;
            return;
         }
         var _loc1_:Number = Math.PI * 2;
         if(this.§_-425§.§_-f1z§ > 0)
         {
            this.§_-vR§.end = (this.§_-425§.activeTime - this.§_-425§.§_-f1z§) / this.§_-425§.activeTime * _loc1_;
         }
         else
         {
            this.§_-vR§.end = _loc1_ - (this.§_-425§.totalCooldown - this.§_-425§.§_-3V§) / this.§_-425§.totalCooldown * _loc1_;
         }
      }
      
      public function get description() : String
      {
         return "";
      }
   }
}

