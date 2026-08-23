package dragonBones.core
{
   import dragonBones.§_-833§;
   import dragonBones.§_-83b§;
   import dragonBones.objects.DBTransform;
   import flash.geom.Matrix;
   
   use namespace dragonBones_internal;
   
   public class §_-Rq§
   {
      
      public var name:String;
      
      public var userData:Object;
      
      public var fixedRotation:Boolean;
      
      dragonBones_internal var §_-Dr§:Matrix;
      
      protected var §_-uN§:int;
      
      dragonBones_internal var §_-fS§:Boolean;
      
      dragonBones_internal var §_-o1e§:DBTransform;
      
      protected var §_-52P§:DBTransform;
      
      protected var §_-J1c§:DBTransform;
      
      dragonBones_internal var §_-T2b§:DBTransform;
      
      protected var §_-H17§:Boolean;
      
      protected var §_-J1T§:§_-83b§;
      
      protected var §_-9Y§:§_-833§;
      
      public function §_-Rq§()
      {
         super();
         this.§_-o1e§ = new DBTransform();
         this.§_-52P§ = new DBTransform();
         this.§_-J1c§ = new DBTransform();
         this.§_-T2b§ = new DBTransform();
         this.§_-T2b§.scaleX = this.§_-T2b§.scaleY = 0;
         this.§_-Dr§ = new Matrix();
         this.§_-H17§ = true;
      }
      
      public function get global() : DBTransform
      {
         return this.§_-o1e§;
      }
      
      public function get §_-x1D§() : DBTransform
      {
         return this.§_-52P§;
      }
      
      public function get offset() : DBTransform
      {
         return this.§_-J1c§;
      }
      
      public function get §_-v2x§() : DBTransform
      {
         return this.§_-J1c§;
      }
      
      public function get visible() : Boolean
      {
         return this.§_-H17§;
      }
      
      public function set visible(param1:Boolean) : void
      {
         this.§_-H17§ = param1;
      }
      
      public function get parent() : §_-83b§
      {
         return this.§_-J1T§;
      }
      
      dragonBones_internal function §_-31J§(param1:§_-83b§) : void
      {
         this.§_-J1T§ = param1;
      }
      
      public function get armature() : §_-833§
      {
         return this.§_-9Y§;
      }
      
      dragonBones_internal function §_-M1q§(param1:§_-833§) : void
      {
         if(this.§_-9Y§)
         {
            this.§_-9Y§.§_-jT§(this);
         }
         this.§_-9Y§ = param1;
         if(this.§_-9Y§)
         {
            this.§_-9Y§.§_-51R§(this);
         }
      }
      
      public function dispose() : void
      {
         this.userData = null;
         this.§_-J1T§ = null;
         this.§_-9Y§ = null;
         this.§_-o1e§ = null;
         this.§_-52P§ = null;
         this.§_-J1c§ = null;
         this.§_-T2b§ = null;
         this.§_-Dr§ = null;
      }
      
      dragonBones_internal function update() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:Matrix = null;
         this.§_-o1e§.scaleX = (this.§_-52P§.scaleX + this.§_-T2b§.scaleX) * this.§_-J1c§.scaleX;
         this.§_-o1e§.scaleY = (this.§_-52P§.scaleY + this.§_-T2b§.scaleY) * this.§_-J1c§.scaleY;
         if(this.§_-J1T§)
         {
            _loc1_ = this.§_-52P§.x + this.§_-J1c§.x + this.§_-T2b§.x;
            _loc2_ = this.§_-52P§.y + this.§_-J1c§.y + this.§_-T2b§.y;
            _loc3_ = this.§_-J1T§.§_-Dr§;
            this.§_-Dr§.tx = this.§_-o1e§.x = _loc3_.a * _loc1_ + _loc3_.c * _loc2_ + _loc3_.tx;
            this.§_-Dr§.ty = this.§_-o1e§.y = _loc3_.d * _loc2_ + _loc3_.b * _loc1_ + _loc3_.ty;
            if(this.fixedRotation)
            {
               this.§_-o1e§.skewX = this.§_-52P§.skewX + this.§_-J1c§.skewX + this.§_-T2b§.skewX;
               this.§_-o1e§.skewY = this.§_-52P§.skewY + this.§_-J1c§.skewY + this.§_-T2b§.skewY;
            }
            else
            {
               this.§_-o1e§.skewX = this.§_-52P§.skewX + this.§_-J1c§.skewX + this.§_-T2b§.skewX + this.§_-J1T§.§_-o1e§.skewX;
               this.§_-o1e§.skewY = this.§_-52P§.skewY + this.§_-J1c§.skewY + this.§_-T2b§.skewY + this.§_-J1T§.§_-o1e§.skewY;
            }
            if(this.§_-J1T§.scaleMode >= this.§_-uN§)
            {
               this.§_-o1e§.scaleX *= this.§_-J1T§.§_-o1e§.scaleX;
               this.§_-o1e§.scaleY *= this.§_-J1T§.§_-o1e§.scaleY;
            }
         }
         else
         {
            this.§_-Dr§.tx = this.§_-o1e§.x = this.§_-52P§.x + this.§_-J1c§.x + this.§_-T2b§.x;
            this.§_-Dr§.ty = this.§_-o1e§.y = this.§_-52P§.y + this.§_-J1c§.y + this.§_-T2b§.y;
            this.§_-o1e§.skewX = this.§_-52P§.skewX + this.§_-J1c§.skewX + this.§_-T2b§.skewX;
            this.§_-o1e§.skewY = this.§_-52P§.skewY + this.§_-J1c§.skewY + this.§_-T2b§.skewY;
         }
         this.§_-Dr§.a = this.§_-o1e§.scaleX * Math.cos(this.§_-o1e§.skewY);
         this.§_-Dr§.b = this.§_-o1e§.scaleX * Math.sin(this.§_-o1e§.skewY);
         this.§_-Dr§.c = -this.§_-o1e§.scaleY * Math.sin(this.§_-o1e§.skewX);
         this.§_-Dr§.d = this.§_-o1e§.scaleY * Math.cos(this.§_-o1e§.skewX);
      }
   }
}

