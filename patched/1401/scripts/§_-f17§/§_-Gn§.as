package §_-f17§
{
   import §_-RI§.§_-h2I§;
   import flash.geom.Point;
   import starling.display.§_-jH§;
   import starling.textures.Texture;
   import utils.§_-Z1S§;
   
   public class §_-Gn§ extends §_-h2I§
   {
      
      private var §_-q2a§:Point = new Point();
      
      private var §_-93u§:Point = new Point();
      
      private var §_-H2O§:Number = 0;
      
      private var §_-Df§:§_-h2I§ = new §_-h2I§();
      
      private var §_-C3H§:int = 0;
      
      private var §_-d2M§:Vector.<§_-jH§> = new Vector.<§_-jH§>();
      
      private var image:§_-jH§;
      
      private var §_-81P§:Texture;
      
      private var §_-Ed§:int = 0;
      
      private var §_-sC§:int = 0;
      
      public function §_-Gn§(param1:Class = null)
      {
         super();
         if(!param1)
         {
            param1 = RopeSegmentView;
         }
         var _loc2_:§_-h2I§ = new §_-h2I§(new param1());
         this.§_-81P§ = _loc2_.texture;
         if(this.§_-81P§ != null)
         {
            this.§_-Ed§ = this.§_-81P§.width;
         }
         §_-83v§(this.§_-Df§);
      }
      
      public function set start(param1:Point) : void
      {
         this.§_-q2a§.x = param1.x;
         this.§_-q2a§.y = param1.y;
         this.x = param1.x;
         this.y = param1.y;
      }
      
      public function set end(param1:Point) : void
      {
         if(this.§_-93u§.equals(param1))
         {
            return;
         }
         this.§_-93u§.x = param1.x;
         this.§_-93u§.y = param1.y;
         this.§_-D11§();
         this.draw();
      }
      
      public function get start() : Point
      {
         return this.§_-q2a§;
      }
      
      public function get end() : Point
      {
         return this.§_-93u§;
      }
      
      public function set offset(param1:Number) : void
      {
         if(this.§_-H2O§ == param1)
         {
            return;
         }
         this.§_-H2O§ = param1;
         this.draw();
      }
      
      public function get length() : Number
      {
         return this.§_-q2a§.clone().subtract(this.§_-93u§).length;
      }
      
      private function §_-D11§() : void
      {
         this.rotation = §_-Z1S§.getAngle(this.§_-q2a§,this.§_-93u§) - 90;
      }
      
      private function draw() : void
      {
         var _loc1_:§_-h2I§ = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(Math.round(this.length) > this.§_-C3H§ + 2 || Math.round(this.length) < this.§_-C3H§ - 2)
         {
            this.§_-C3H§ = Math.round(this.length);
            _loc1_ = new §_-h2I§();
            _loc2_ = Math.ceil(this.length / this.§_-Ed§);
            _loc3_ = Math.max(_loc2_ - 1,0);
            if(_loc2_ == this.§_-sC§)
            {
               return;
            }
            _loc4_ = _loc3_;
            _loc5_ = int(this.§_-d2M§.length);
            while(_loc4_ < _loc5_)
            {
               this.§_-d2M§[_loc4_].removeFromParent(true);
               this.§_-d2M§[_loc4_] = null;
               _loc4_++;
            }
            this.§_-d2M§.length = Math.min(this.§_-d2M§.length,_loc3_);
            _loc3_ = Math.max(0,this.§_-d2M§.length - 1);
            _loc6_ = _loc3_;
            _loc7_ = _loc2_;
            while(_loc6_ < _loc7_)
            {
               this.image = new §_-jH§(this.§_-81P§);
               this.image.x = _loc6_ * this.§_-Ed§;
               this.image.y = -this.image.height * 0.5;
               this.§_-d2M§.push(this.image);
               _loc1_.§_-83v§(this.image);
               _loc6_++;
            }
            this.§_-sC§ = _loc2_;
            this.§_-Df§.§_-83v§(_loc1_);
         }
      }
   }
}

