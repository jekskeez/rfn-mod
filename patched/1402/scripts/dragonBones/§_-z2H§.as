package dragonBones
{
   import §_-6R§.§_-E20§;
   import dragonBones.core.§_-Rq§;
   import dragonBones.core.dragonBones_internal;
   import dragonBones.objects.DisplayData;
   import flash.geom.Matrix;
   
   use namespace dragonBones_internal;
   
   public class §_-z2H§ extends §_-Rq§
   {
      
      dragonBones_internal var §_-T2§:Vector.<DisplayData>;
      
      dragonBones_internal var §_-Z2T§:§_-E20§;
      
      dragonBones_internal var §_-E1i§:Number;
      
      dragonBones_internal var §_-51D§:Number;
      
      dragonBones_internal var §_-Et§:Boolean;
      
      private var §_-j1Y§:Boolean;
      
      private var §_-C1H§:Number;
      
      private var §_-NK§:int;
      
      private var §_-5X§:String;
      
      private var §_-q26§:Array;
      
      public function §_-z2H§(param1:§_-E20§)
      {
         super();
         this.§_-Z2T§ = param1;
         this.§_-q26§ = [];
         this.§_-NK§ = -1;
         §_-uN§ = 1;
         this.§_-E1i§ = 0;
         this.§_-51D§ = 0;
         this.§_-C1H§ = 0;
         this.§_-Et§ = false;
         this.§_-j1Y§ = false;
         this.§_-5X§ = "normal";
         if(this.§_-Z2T§.display)
         {
            this.§_-Z2T§.§_-92H§(this.§_-5X§);
         }
      }
      
      public function get zOrder() : Number
      {
         return this.§_-E1i§ + this.§_-51D§ + this.§_-C1H§;
      }
      
      public function set zOrder(param1:Number) : void
      {
         if(this.zOrder != param1)
         {
            this.§_-C1H§ = param1 - this.§_-E1i§ - this.§_-51D§;
            if(this.§_-9Y§)
            {
               this.§_-9Y§.§_-uT§ = true;
            }
         }
      }
      
      public function get blendMode() : String
      {
         return this.§_-5X§;
      }
      
      public function set blendMode(param1:String) : void
      {
         if(this.§_-5X§ != param1)
         {
            this.§_-5X§ = param1;
            if(this.§_-Z2T§.display)
            {
               this.§_-Z2T§.§_-92H§(this.§_-5X§);
            }
         }
      }
      
      public function get display() : Object
      {
         var _loc1_:Object = this.§_-q26§[this.§_-NK§];
         if(_loc1_ is §_-833§)
         {
            return _loc1_.display;
         }
         return _loc1_;
      }
      
      public function set display(param1:Object) : void
      {
         this.§_-q26§[this.§_-NK§] = param1;
         this.§_-N21§(param1);
      }
      
      public function get childArmature() : §_-833§
      {
         if(this.§_-q26§[this.§_-NK§] is §_-833§)
         {
            return this.§_-q26§[this.§_-NK§] as §_-833§;
         }
         return null;
      }
      
      public function set childArmature(param1:§_-833§) : void
      {
         this.§_-q26§[this.§_-NK§] = param1;
         if(param1)
         {
            this.§_-N21§(param1.display);
         }
      }
      
      public function get §_-RG§() : Array
      {
         return this.§_-q26§;
      }
      
      public function set §_-RG§(param1:Array) : void
      {
         var _loc3_:int = 0;
         if(!param1)
         {
            throw new ArgumentError();
         }
         var _loc2_:* = int(this.§_-q26§.length = param1.length);
         while(_loc2_--)
         {
            this.§_-q26§[_loc2_] = param1[_loc2_];
         }
         if(this.§_-NK§ >= 0)
         {
            _loc3_ = this.§_-NK§;
            this.§_-NK§ = -1;
            this.§_-YG§(_loc3_);
         }
      }
      
      private function §_-N21§(param1:Object) : void
      {
         if(this.§_-Z2T§.display)
         {
            this.§_-Z2T§.display = param1;
         }
         else
         {
            this.§_-Z2T§.display = param1;
            if(this.§_-9Y§)
            {
               this.§_-Z2T§.§_-A3B§(this.§_-9Y§.display);
               this.§_-9Y§.§_-uT§ = true;
            }
         }
         this.§_-KX§();
         if(!this.§_-j1Y§ && Boolean(this.§_-Z2T§.display))
         {
            this.§_-Et§ = true;
            this.§_-Z2T§.§_-92H§(this.§_-5X§);
         }
         else
         {
            this.§_-Et§ = false;
         }
      }
      
      dragonBones_internal function §_-YG§(param1:int) : void
      {
         var _loc2_:uint = 0;
         var _loc3_:Boolean = false;
         var _loc4_:Object = null;
         if(param1 < 0)
         {
            if(!this.§_-j1Y§)
            {
               this.§_-j1Y§ = true;
               this.§_-Z2T§.§_-Ia§();
               this.§_-KX§();
            }
         }
         else
         {
            if(this.§_-j1Y§)
            {
               this.§_-j1Y§ = false;
               _loc3_ = true;
               if(this.§_-9Y§)
               {
                  this.§_-Z2T§.§_-A3B§(this.§_-9Y§.display);
                  this.§_-9Y§.§_-uT§ = true;
               }
            }
            _loc2_ = this.§_-q26§.length;
            if(param1 >= _loc2_ && _loc2_ > 0)
            {
               param1 = _loc2_ - 1;
            }
            if(this.§_-NK§ != param1)
            {
               this.§_-NK§ = param1;
               _loc4_ = this.§_-q26§[this.§_-NK§];
               if(_loc4_ is §_-833§)
               {
                  this.§_-N21§((_loc4_ as §_-833§).display);
               }
               else
               {
                  this.§_-N21§(_loc4_);
               }
               if(Boolean(this.§_-T2§) && this.§_-NK§ <= this.§_-T2§.length)
               {
                  this.§_-52P§.copy(this.§_-T2§[this.§_-NK§].transform);
               }
            }
            else if(_loc3_)
            {
               this.§_-KX§();
            }
         }
         if(!this.§_-j1Y§ && Boolean(this.§_-Z2T§.display))
         {
            this.§_-Et§ = true;
         }
         else
         {
            this.§_-Et§ = false;
         }
      }
      
      override public function set visible(param1:Boolean) : void
      {
         if(param1 != this.§_-H17§)
         {
            this.§_-H17§ = param1;
            this.§_-V2b§(this.§_-H17§);
         }
      }
      
      override dragonBones_internal function §_-M1q§(param1:§_-833§) : void
      {
         super.dragonBones_internal::§_-M1q§(param1);
         if(this.§_-9Y§)
         {
            this.§_-9Y§.§_-uT§ = true;
            this.§_-Z2T§.§_-A3B§(this.§_-9Y§.display);
         }
         else
         {
            this.§_-Z2T§.§_-Ia§();
         }
      }
      
      override public function dispose() : void
      {
         if(!this.§_-Z2T§)
         {
            return;
         }
         super.dispose();
         this.§_-Z2T§.dispose();
         this.§_-q26§.length = 0;
         this.§_-Z2T§ = null;
         this.§_-q26§ = null;
         this.§_-T2§ = null;
      }
      
      override dragonBones_internal function update() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:Matrix = null;
         super.dragonBones_internal::update();
         if(this.§_-Et§)
         {
            _loc1_ = §_-J1T§.§_-G1§.x;
            _loc2_ = §_-J1T§.§_-G1§.y;
            if(Boolean(_loc1_) || Boolean(_loc2_))
            {
               _loc3_ = §_-J1T§.§_-Dr§;
               this.§_-Dr§.tx += _loc3_.a * _loc1_ + _loc3_.c * _loc2_;
               this.§_-Dr§.ty += _loc3_.b * _loc1_ + _loc3_.d * _loc2_;
            }
            this.§_-Z2T§.§_-Mh§(this.§_-Dr§,this.§_-o1e§);
         }
      }
      
      dragonBones_internal function §_-V2b§(param1:Boolean) : void
      {
         this.§_-Z2T§.visible = this.§_-J1T§.visible && this.§_-H17§ && param1;
      }
      
      private function §_-KX§() : void
      {
         var _loc1_:§_-833§ = this.childArmature;
         if(_loc1_)
         {
            if(this.§_-j1Y§)
            {
               _loc1_.animation.stop();
               _loc1_.animation.§_-22V§ = null;
            }
            else if(Boolean(this.§_-9Y§) && Boolean(this.§_-9Y§.animation.§_-g2u§) && _loc1_.animation.§_-B1s§(this.§_-9Y§.animation.§_-g2u§.name))
            {
               _loc1_.animation.gotoAndPlay(this.§_-9Y§.animation.§_-g2u§.name);
            }
            else
            {
               _loc1_.animation.play();
            }
         }
      }
      
      public function §_-I27§(param1:Array) : void
      {
         this.§_-RG§ = param1;
      }
   }
}

