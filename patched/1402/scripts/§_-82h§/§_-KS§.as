package §_-82h§
{
   import §_-TK§.§_-aS§;
   import flash.geom.Point;
   import starling.display.§_-I2q§;
   import starling.textures.Texture;
   import utils.§_-iZ§;
   
   public class §_-KS§ extends §_-aS§
   {
      
      private var §_-L1§:Point = new Point();
      
      private var §_-Z5§:Point = new Point();
      
      private var §_-J1c§:Number = 0;
      
      private var §_-o1c§:§_-aS§ = new §_-aS§();
      
      private var §_-q1W§:int = 0;
      
      private var §_-623§:Vector.<§_-I2q§> = new Vector.<§_-I2q§>();
      
      private var image:§_-I2q§;
      
      private var §_-z2O§:Texture;
      
      private var §_-k1o§:int = 0;
      
      private var §_-01m§:int = 0;
      
      public function §_-KS§(param1:Class = null)
      {
         super();
         if(!param1)
         {
            param1 = RopeSegmentView;
         }
         var _loc2_:§_-aS§ = new §_-aS§(new param1());
         this.§_-z2O§ = _loc2_.texture;
         if(this.§_-z2O§ != null)
         {
            this.§_-k1o§ = this.§_-z2O§.width;
         }
         §_-J2J§(this.§_-o1c§);
      }
      
      public function set start(param1:Point) : void
      {
         this.§_-L1§.x = param1.x;
         this.§_-L1§.y = param1.y;
         this.x = param1.x;
         this.y = param1.y;
      }
      
      public function set end(param1:Point) : void
      {
         if(this.§_-Z5§.equals(param1))
         {
            return;
         }
         this.§_-Z5§.x = param1.x;
         this.§_-Z5§.y = param1.y;
         this.§_-le§();
         this.draw();
      }
      
      public function get start() : Point
      {
         return this.§_-L1§;
      }
      
      public function get end() : Point
      {
         return this.§_-Z5§;
      }
      
      public function set offset(param1:Number) : void
      {
         if(this.§_-J1c§ == param1)
         {
            return;
         }
         this.§_-J1c§ = param1;
         this.draw();
      }
      
      public function get length() : Number
      {
         return this.§_-L1§.clone().subtract(this.§_-Z5§).length;
      }
      
      private function §_-le§() : void
      {
         this.rotation = §_-iZ§.getAngle(this.§_-L1§,this.§_-Z5§) - 90;
      }
      
      private function draw() : void
      {
         var _loc1_:§_-aS§ = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(Math.round(this.length) > this.§_-q1W§ + 2 || Math.round(this.length) < this.§_-q1W§ - 2)
         {
            this.§_-q1W§ = Math.round(this.length);
            _loc1_ = new §_-aS§();
            _loc2_ = Math.ceil(this.length / this.§_-k1o§);
            _loc3_ = Math.max(_loc2_ - 1,0);
            if(_loc2_ == this.§_-01m§)
            {
               return;
            }
            _loc4_ = _loc3_;
            _loc5_ = int(this.§_-623§.length);
            while(_loc4_ < _loc5_)
            {
               this.§_-623§[_loc4_].removeFromParent(true);
               this.§_-623§[_loc4_] = null;
               _loc4_++;
            }
            this.§_-623§.length = Math.min(this.§_-623§.length,_loc3_);
            _loc3_ = Math.max(0,this.§_-623§.length - 1);
            _loc6_ = _loc3_;
            _loc7_ = _loc2_;
            while(_loc6_ < _loc7_)
            {
               this.image = new §_-I2q§(this.§_-z2O§);
               this.image.x = _loc6_ * this.§_-k1o§;
               this.image.y = -this.image.height * 0.5;
               this.§_-623§.push(this.image);
               _loc1_.§_-J2J§(this.image);
               _loc6_++;
            }
            this.§_-01m§ = _loc2_;
            this.§_-o1c§.§_-J2J§(_loc1_);
         }
      }
   }
}

