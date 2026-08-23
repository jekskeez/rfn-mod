package §_-S1n§
{
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import game.mainGame.GameMap;
   import utils.§_-K1Y§;
   
   public class §_-K1y§ extends §_-Sr§
   {
      
      private static const §_-q2o§:Number = 5;
      
      private static const §_-A3C§:Number = 8;
      
      private static const §_-qW§:Number = 5;
      
      private static const §_-l18§:Number = 4;
      
      private static const §_-9k§:Number = 13;
      
      private static const §_-kR§:Number = 10;
      
      private static const §_-A2v§:Number = 20;
      
      private static const §_-d2Z§:Number = 10;
      
      private static const §_-13s§:Number = 20;
      
      private static const §_-iS§:Number = 6;
      
      private static const §_-N1s§:Number = 10;
      
      private static const §_-S23§:Number = 7;
      
      private static const §_-41u§:Number = 5;
      
      private var §_-K2c§:Array;
      
      private var §_-63k§:Number;
      
      private var §_-O1K§:Point;
      
      public function §_-K1y§(param1:DisplayObject, param2:Number, param3:String = "", param4:Boolean = false, param5:Point = null, param6:Array = null)
      {
         super(param1,param3,param4,isHtml);
         this.§_-O1K§ = param5;
         this.§_-63k§ = param2;
         this.§_-K2c§ = [];
         this.field.y += §_-l18§;
         this.mouseEnabled = false;
         this.mouseChildren = false;
         if(param6)
         {
            this.§_-qL§(param6);
         }
         if(this.§_-j2G§)
         {
            this.setPosition(this.§_-O1K§.x,this.§_-O1K§.y);
         }
      }
      
      override public function setStatus(param1:String) : void
      {
         super.setStatus(param1);
         if(Boolean(this.§_-K2c§) && this.§_-K2c§.length > 0)
         {
            this.§_-qL§(this.§_-K2c§.slice());
         }
      }
      
      override public function hide() : void
      {
         super.hide();
         close();
      }
      
      public function get §_-j2G§() : Boolean
      {
         return this.§_-O1K§ != null;
      }
      
      public function setPosition(param1:Number, param2:Number) : void
      {
         this.x = Math.max(§_-d2Z§,param1);
         this.y = Math.max(§_-d2Z§,param2);
         this.x = Math.min(this.x,GameMap.§_-O19§ - this.width - §_-d2Z§);
         this.y = Math.min(this.y,GameMap.§_-Gd§ - this.height - §_-d2Z§);
         this.fixed = new Point(this.x,this.y);
      }
      
      public function §_-qL§(param1:Array, param2:Number = 20) : void
      {
         var _loc10_:Object = null;
         var _loc11_:DisplayObject = null;
         var _loc12_:Number = NaN;
         var _loc13_:Point = null;
         this.§_-w1s§();
         this.§_-K2c§ = [];
         if(!param1 || param1.length == 0)
         {
            update();
            return;
         }
         var _loc3_:Array = this.§_-lx§(param1,param2);
         var _loc4_:Number = this.§_-w1F§(_loc3_);
         var _loc5_:Number = field.x + field.textWidth + §_-iS§;
         var _loc6_:Number = _loc5_ + §_-A3C§;
         var _loc7_:Number = _loc6_ + _loc4_;
         var _loc8_:Number = this.§_-63k§ + _loc4_;
         var _loc9_:Number = Math.max(_loc8_,_loc7_);
         for each(_loc10_ in _loc3_)
         {
            _loc11_ = _loc10_.image;
            _loc12_ = Number(_loc10_.width);
            addChild(_loc11_);
            _loc11_.x = _loc9_ - _loc12_;
            _loc11_.y = §_-q2o§;
            _loc9_ = _loc11_.x - §_-qW§;
            this.§_-K2c§.push(_loc11_);
         }
         update();
         if(Boolean(this.§_-j2G§ && this.§_-O1K§ != null) && Boolean(this.§_-P1X§) && Boolean(this.§_-P1X§.parent))
         {
            _loc13_ = this.§_-P1X§.parent.localToGlobal(new Point(this.§_-P1X§.x,this.§_-P1X§.y));
            this.setPosition(_loc13_.x - this.width - §_-d2Z§,this.§_-O1K§.y);
         }
         else if(this.§_-j2G§ && this.§_-O1K§ != null)
         {
            this.setPosition(this.§_-O1K§.x,this.§_-O1K§.y);
         }
      }
      
      public function §_-t18§(param1:DisplayObject, param2:Number, param3:Number, param4:Number) : void
      {
         addChild(param1);
         param1.scaleX = param1.scaleY = param2;
         param1.x = param3;
         param1.y = param4;
         update();
      }
      
      public function §_-P2W§(param1:Class, param2:String, param3:Number, param4:Number, param5:Number) : void
      {
         §_-K1Y§.§_-P2W§(this.field,param2,param1,param3,param3,param4,param5,this.isHtml,true);
         update();
      }
      
      public function get fixed() : Point
      {
         return this.§_-O1K§;
      }
      
      public function set fixed(param1:Point) : void
      {
         if(param1)
         {
            this.§_-P1X§.removeEventListener(MouseEvent.MOUSE_MOVE,§_-Cv§);
         }
         else
         {
            this.§_-P1X§.addEventListener(MouseEvent.MOUSE_MOVE,§_-Cv§);
         }
         this.§_-O1K§ = param1;
      }
      
      override protected function draw() : void
      {
         this.graphics.clear();
         this.graphics.beginFill(16777215,0.9);
         this.graphics.drawRoundRectComplex(0,0,this.width + §_-N1s§,this.height + §_-S23§,§_-41u§,§_-41u§,§_-41u§,§_-41u§);
         this.graphics.endFill();
      }
      
      override protected function §_-O1s§(param1:MouseEvent) : void
      {
         if(!this.§_-j2G§)
         {
            this.§_-Xn§(param1);
         }
         if(param1.type == MouseEvent.MOUSE_UP && Game.§_-q1L§.contains(this))
         {
            Game.§_-q1L§.removeChild(this);
         }
         if(Game.§_-q1L§.contains(this))
         {
            return;
         }
         Game.§_-q1L§.addChild(this);
         this.mouseEnabled = false;
         this.mouseChildren = false;
         this.visible = true;
      }
      
      private function §_-Xn§(param1:MouseEvent) : void
      {
         var _loc2_:Point = Game.§_-q1L§.globalToLocal(new Point(param1.stageX,param1.stageY));
         var _loc3_:Number = _loc2_.x + §_-9k§;
         var _loc4_:Number = _loc2_.y + §_-kR§;
         if(_loc3_ + this.width > §_-Zy§.§_-21V§)
         {
            _loc3_ = _loc2_.x - this.width;
         }
         if(_loc4_ + this.height > §_-Zy§.§_-02T§)
         {
            _loc4_ = _loc2_.y - this.height;
         }
         if(this.§_-83F§(_loc3_,_loc4_,_loc2_))
         {
            _loc4_ = this.§_-I2r§(_loc4_,_loc2_);
         }
         this.x = _loc3_;
         this.y = _loc4_;
      }
      
      private function §_-83F§(param1:Number, param2:Number, param3:Point) : Boolean
      {
         return param1 <= param3.x && param1 + this.width >= param3.x - §_-A2v§ && param2 <= param3.y && param2 + this.height >= param3.y - §_-A2v§;
      }
      
      private function §_-I2r§(param1:Number, param2:Point) : Number
      {
         param1 = param2.y + §_-A2v§;
         if(param1 + this.height > §_-Zy§.§_-02T§)
         {
            param1 = param2.y - this.height - §_-A2v§;
            if(param1 < 0)
            {
               param1 = param2.y + §_-A2v§;
            }
         }
         return param1;
      }
      
      private function §_-w1s§() : void
      {
         var _loc1_:DisplayObject = null;
         for each(_loc1_ in this.§_-K2c§)
         {
            if(contains(_loc1_))
            {
               removeChild(_loc1_);
            }
         }
      }
      
      private function §_-lx§(param1:Array, param2:Number) : Array
      {
         var _loc4_:DisplayObject = null;
         var _loc3_:Array = [];
         for each(_loc4_ in param1)
         {
            if(_loc4_.height > param2)
            {
               _loc4_.scaleY = _loc4_.scaleX = param2 / _loc4_.height;
            }
            _loc3_.push({
               "image":_loc4_,
               "width":_loc4_.width * _loc4_.scaleX
            });
         }
         return _loc3_;
      }
      
      private function §_-w1F§(param1:Array) : Number
      {
         var _loc2_:Number = 0;
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            if(_loc3_ > 0)
            {
               _loc2_ += §_-qW§;
            }
            _loc2_ += param1[_loc3_].width;
            _loc3_++;
         }
         return _loc2_;
      }
   }
}

