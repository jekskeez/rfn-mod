package starling.display
{
   import §_-K2c§.Event;
   import flash.geom.Matrix;
   import flash.geom.Matrix3D;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import starling.core.§_-T2v§;
   import starling.utils.§_-U2t§;
   import starling.utils.§_-rI§;
   
   public class Sprite extends DisplayObjectContainer
   {
      
      private static var §_-S19§:Matrix = new Matrix();
      
      private static var §_-G2g§:Point = new Point();
      
      private static var §_-02i§:Rectangle = new Rectangle();
      
      private var §_-136§:Vector.<§_-t2M§>;
      
      private var §_-d2C§:Boolean;
      
      private var §_-24§:Boolean;
      
      private var §_-oN§:Rectangle;
      
      public function Sprite()
      {
         super();
      }
      
      override public function dispose() : void
      {
         this.§_-Q2T§();
         super.dispose();
      }
      
      private function §_-Q2T§() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(this.§_-136§)
         {
            _loc1_ = 0;
            _loc2_ = int(this.§_-136§.length);
            while(_loc1_ < _loc2_)
            {
               this.§_-136§[_loc1_].dispose();
               _loc1_++;
            }
            this.§_-136§ = null;
         }
      }
      
      public function flatten(param1:Boolean = false) : void
      {
         this.§_-d2C§ = true;
         this.§_-24§ = param1;
         §_-v26§(Event.§_-b2W§);
      }
      
      public function §_-rS§() : void
      {
         this.§_-d2C§ = false;
         this.§_-Q2T§();
      }
      
      public function get §_-x1R§() : Boolean
      {
         return this.§_-136§ != null || this.§_-d2C§;
      }
      
      public function get §_-r2Q§() : Rectangle
      {
         return this.§_-oN§;
      }
      
      public function set §_-r2Q§(param1:Rectangle) : void
      {
         if(Boolean(this.§_-oN§) && Boolean(param1))
         {
            this.§_-oN§.copyFrom(param1);
         }
         else
         {
            this.§_-oN§ = param1 ? param1.clone() : null;
         }
      }
      
      public function §_-rn§(param1:DisplayObject, param2:Rectangle = null) : Rectangle
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc11_:Point = null;
         if(this.§_-oN§ == null)
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
         var _loc9_:Matrix = §_-eJ§(param1,§_-S19§);
         var _loc10_:int = 0;
         while(_loc10_ < 4)
         {
            switch(_loc10_)
            {
               case 0:
                  _loc3_ = this.§_-oN§.left;
                  _loc4_ = this.§_-oN§.top;
                  break;
               case 1:
                  _loc3_ = this.§_-oN§.left;
                  _loc4_ = this.§_-oN§.bottom;
                  break;
               case 2:
                  _loc3_ = this.§_-oN§.right;
                  _loc4_ = this.§_-oN§.top;
                  break;
               case 3:
                  _loc3_ = this.§_-oN§.right;
                  _loc4_ = this.§_-oN§.bottom;
            }
            _loc11_ = §_-rI§.§_-Sy§(_loc9_,_loc3_,_loc4_,§_-G2g§);
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
         if(this.§_-oN§)
         {
            §_-U2t§.§_-F1s§(_loc3_,this.§_-rn§(param1,§_-02i§),_loc3_);
         }
         return _loc3_;
      }
      
      override public function hitTest(param1:Point, param2:Boolean = false) : DisplayObject
      {
         if(this.§_-oN§ != null && !this.§_-oN§.containsPoint(param1))
         {
            return null;
         }
         return super.hitTest(param1,param2);
      }
      
      override public function render(param1:§_-T2v§, param2:Number) : void
      {
         var _loc3_:Rectangle = null;
         var _loc4_:Number = NaN;
         var _loc5_:int = 0;
         var _loc6_:Matrix3D = null;
         var _loc7_:int = 0;
         var _loc8_:§_-t2M§ = null;
         var _loc9_:String = null;
         if(this.§_-oN§)
         {
            _loc3_ = param1.§_-i1b§(this.§_-rn§(stage,§_-02i§));
            if(_loc3_.isEmpty())
            {
               param1.§_-L2f§();
               return;
            }
         }
         if(Boolean(this.§_-136§) || this.§_-d2C§)
         {
            if(this.§_-136§ == null)
            {
               this.§_-136§ = new Vector.<§_-t2M§>(0);
            }
            if(this.§_-d2C§)
            {
               §_-t2M§.§_-r1I§(this,this.§_-136§);
               if(this.§_-24§)
               {
                  §_-t2M§.§_-j1B§(this.§_-136§);
               }
               param1.§_-fq§();
               this.§_-d2C§ = false;
            }
            _loc4_ = param2 * this.alpha;
            _loc5_ = int(this.§_-136§.length);
            _loc6_ = param1.mvpMatrix3D;
            param1.§_-A1U§();
            param1.raiseDrawCount(_loc5_);
            _loc7_ = 0;
            while(_loc7_ < _loc5_)
            {
               _loc8_ = this.§_-136§[_loc7_];
               _loc9_ = _loc8_.blendMode == BlendMode.AUTO ? param1.blendMode : _loc8_.blendMode;
               _loc8_.§_-q1X§(_loc6_,_loc4_,_loc9_);
               _loc7_++;
            }
         }
         else
         {
            super.render(param1,param2);
         }
         if(this.§_-oN§)
         {
            param1.§_-L2f§();
         }
      }
   }
}

