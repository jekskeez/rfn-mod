package starling.display
{
   import §_-f1T§.Event;
   import flash.geom.Matrix;
   import flash.geom.Matrix3D;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import starling.core.§_-wz§;
   import starling.utils.§_-F2o§;
   import starling.utils.§_-r1p§;
   
   public class Sprite extends DisplayObjectContainer
   {
      
      private static var §_-7w§:Matrix = new Matrix();
      
      private static var §_-O§:Point = new Point();
      
      private static var §_-T1w§:Rectangle = new Rectangle();
      
      private var §_-v2j§:Vector.<§_-81s§>;
      
      private var §_-h6§:Boolean;
      
      private var §_-41H§:Boolean;
      
      private var §_-92l§:Rectangle;
      
      public function Sprite()
      {
         super();
      }
      
      override public function dispose() : void
      {
         this.§_-92c§();
         super.dispose();
      }
      
      private function §_-92c§() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(this.§_-v2j§)
         {
            _loc1_ = 0;
            _loc2_ = int(this.§_-v2j§.length);
            while(_loc1_ < _loc2_)
            {
               this.§_-v2j§[_loc1_].dispose();
               _loc1_++;
            }
            this.§_-v2j§ = null;
         }
      }
      
      public function flatten(param1:Boolean = false) : void
      {
         this.§_-h6§ = true;
         this.§_-41H§ = param1;
         §_-NH§(Event.§_-g2f§);
      }
      
      public function §_-Q2r§() : void
      {
         this.§_-h6§ = false;
         this.§_-92c§();
      }
      
      public function get §_-Fw§() : Boolean
      {
         return this.§_-v2j§ != null || this.§_-h6§;
      }
      
      public function get §_-51s§() : Rectangle
      {
         return this.§_-92l§;
      }
      
      public function set §_-51s§(param1:Rectangle) : void
      {
         if(Boolean(this.§_-92l§) && Boolean(param1))
         {
            this.§_-92l§.copyFrom(param1);
         }
         else
         {
            this.§_-92l§ = param1 ? param1.clone() : null;
         }
      }
      
      public function §_-v20§(param1:DisplayObject, param2:Rectangle = null) : Rectangle
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc11_:Point = null;
         if(this.§_-92l§ == null)
         {
            return null;
         }
         if(param2 == null)
         {
            param2 = new Rectangle();
         }
         var _loc5_:Number = Number.MAX_VALUE;
         var _loc6_:Number = -Number.MAX_VALUE;
         var _loc7_:Number = Number.MAX_VALUE;
         var _loc8_:Number = -Number.MAX_VALUE;
         var _loc9_:Matrix = §_-R1D§(param1,§_-7w§);
         var _loc10_:int = 0;
         while(_loc10_ < 4)
         {
            switch(_loc10_)
            {
               case 0:
                  _loc3_ = this.§_-92l§.left;
                  _loc4_ = this.§_-92l§.top;
                  break;
               case 1:
                  _loc3_ = this.§_-92l§.left;
                  _loc4_ = this.§_-92l§.bottom;
                  break;
               case 2:
                  _loc3_ = this.§_-92l§.right;
                  _loc4_ = this.§_-92l§.top;
                  break;
               case 3:
                  _loc3_ = this.§_-92l§.right;
                  _loc4_ = this.§_-92l§.bottom;
            }
            _loc11_ = §_-r1p§.§_-317§(_loc9_,_loc3_,_loc4_,§_-O§);
            if(_loc5_ > _loc11_.x)
            {
               _loc5_ = _loc11_.x;
            }
            if(_loc6_ < _loc11_.x)
            {
               _loc6_ = _loc11_.x;
            }
            if(_loc7_ > _loc11_.y)
            {
               _loc7_ = _loc11_.y;
            }
            if(_loc8_ < _loc11_.y)
            {
               _loc8_ = _loc11_.y;
            }
            _loc10_++;
         }
         param2.setTo(_loc5_,_loc7_,_loc6_ - _loc5_,_loc8_ - _loc7_);
         return param2;
      }
      
      override public function getBounds(param1:DisplayObject, param2:Rectangle = null) : Rectangle
      {
         var _loc3_:Rectangle = super.getBounds(param1,param2);
         if(this.§_-92l§)
         {
            §_-F2o§.§_-42v§(_loc3_,this.§_-v20§(param1,§_-T1w§),_loc3_);
         }
         return _loc3_;
      }
      
      override public function hitTest(param1:Point, param2:Boolean = false) : DisplayObject
      {
         if(this.§_-92l§ != null && !this.§_-92l§.containsPoint(param1))
         {
            return null;
         }
         return super.hitTest(param1,param2);
      }
      
      override public function render(param1:§_-wz§, param2:Number) : void
      {
         var _loc3_:Rectangle = null;
         var _loc4_:Number = NaN;
         var _loc5_:int = 0;
         var _loc6_:Matrix3D = null;
         var _loc7_:int = 0;
         var _loc8_:§_-81s§ = null;
         var _loc9_:String = null;
         if(this.§_-92l§)
         {
            _loc3_ = param1.§_-DM§(this.§_-v20§(stage,§_-T1w§));
            if(_loc3_.isEmpty())
            {
               param1.§_-b0§();
               return;
            }
         }
         if(Boolean(this.§_-v2j§) || this.§_-h6§)
         {
            if(this.§_-v2j§ == null)
            {
               this.§_-v2j§ = new Vector.<§_-81s§>(0);
            }
            if(this.§_-h6§)
            {
               §_-81s§.§_-h2F§(this,this.§_-v2j§);
               if(this.§_-41H§)
               {
                  §_-81s§.§_-mP§(this.§_-v2j§);
               }
               param1.§_-23A§();
               this.§_-h6§ = false;
            }
            _loc4_ = param2 * this.alpha;
            _loc5_ = int(this.§_-v2j§.length);
            _loc6_ = param1.mvpMatrix3D;
            param1.§_-z24§();
            param1.raiseDrawCount(_loc5_);
            _loc7_ = 0;
            while(_loc7_ < _loc5_)
            {
               _loc8_ = this.§_-v2j§[_loc7_];
               _loc9_ = _loc8_.blendMode == BlendMode.AUTO ? param1.blendMode : _loc8_.blendMode;
               _loc8_.§_-TG§(_loc6_,_loc4_,_loc9_);
               _loc7_++;
            }
         }
         else
         {
            super.render(param1,param2);
         }
         if(this.§_-92l§)
         {
            param1.§_-b0§();
         }
      }
   }
}

