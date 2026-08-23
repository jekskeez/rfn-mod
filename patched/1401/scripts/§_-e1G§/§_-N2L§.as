package §_-e1G§
{
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import game.mainGame.GameMap;
   import utils.§_-jB§;
   
   public class §_-N2L§ extends §_-YM§
   {
      
      private static const §_-Ta§:Number = 5;
      
      private static const §_-V0§:Number = 8;
      
      private static const §_-U2m§:Number = 5;
      
      private static const §_-I2P§:Number = 4;
      
      private static const §_-V1x§:Number = 13;
      
      private static const §_-B3f§:Number = 10;
      
      private static const §_-t1e§:Number = 20;
      
      private static const §_-U1b§:Number = 10;
      
      private static const §_-b2t§:Number = 20;
      
      private static const §_-13B§:Number = 6;
      
      private static const §_-KS§:Number = 10;
      
      private static const §_-w2§:Number = 7;
      
      private static const §_-C3M§:Number = 5;
      
      private var §_-vG§:Array;
      
      private var §_-Gz§:Number;
      
      private var §_-c5§:Point;
      
      public function §_-N2L§(param1:DisplayObject, param2:Number, param3:String = "", param4:Boolean = false, param5:Point = null, param6:Array = null)
      {
         super(param1,param3,param4,isHtml);
         this.§_-c5§ = param5;
         this.§_-Gz§ = param2;
         this.§_-vG§ = [];
         this.field.y += §_-I2P§;
         this.mouseEnabled = false;
         this.mouseChildren = false;
         if(param6)
         {
            this.§_-b2m§(param6);
         }
         if(this.§_-b6§)
         {
            this.setPosition(this.§_-c5§.x,this.§_-c5§.y);
         }
      }
      
      override public function setStatus(param1:String) : void
      {
         super.setStatus(param1);
         if(Boolean(this.§_-vG§) && this.§_-vG§.length > 0)
         {
            this.§_-b2m§(this.§_-vG§.slice());
         }
      }
      
      override public function hide() : void
      {
         super.hide();
         close();
      }
      
      public function get §_-b6§() : Boolean
      {
         return this.§_-c5§ != null;
      }
      
      public function setPosition(param1:Number, param2:Number) : void
      {
         this.x = Math.max(§_-U1b§,param1);
         this.y = Math.max(§_-U1b§,param2);
         this.x = Math.min(this.x,GameMap.§_-q1n§ - this.width - §_-U1b§);
         this.y = Math.min(this.y,GameMap.§_-P1Q§ - this.height - §_-U1b§);
         this.fixed = new Point(this.x,this.y);
      }
      
      public function §_-b2m§(param1:Array, param2:Number = 20) : void
      {
         var _loc10_:Object = null;
         var _loc11_:DisplayObject = null;
         var _loc12_:Number = NaN;
         var _loc13_:Point = null;
         this.§_-p1t§();
         this.§_-vG§ = [];
         if(!param1 || param1.length == 0)
         {
            update();
            return;
         }
         var _loc3_:Array = this.§_-We§(param1,param2);
         var _loc4_:Number = this.§_-U2Y§(_loc3_);
         var _loc5_:Number = field.x + field.textWidth + §_-13B§;
         var _loc6_:Number = _loc5_ + §_-V0§;
         var _loc7_:Number = _loc6_ + _loc4_;
         var _loc8_:Number = this.§_-Gz§ + _loc4_;
         var _loc9_:Number = Math.max(_loc8_,_loc7_);
         for each(_loc10_ in _loc3_)
         {
            _loc11_ = _loc10_.image;
            _loc12_ = Number(_loc10_.width);
            addChild(_loc11_);
            _loc11_.x = _loc9_ - _loc12_;
            _loc11_.y = §_-Ta§;
            _loc9_ = _loc11_.x - §_-U2m§;
            this.§_-vG§.push(_loc11_);
         }
         update();
         if(Boolean(this.§_-b6§ && this.§_-c5§ != null) && Boolean(this.§_-u1B§) && Boolean(this.§_-u1B§.parent))
         {
            _loc13_ = this.§_-u1B§.parent.localToGlobal(new Point(this.§_-u1B§.x,this.§_-u1B§.y));
            this.setPosition(_loc13_.x - this.width - §_-U1b§,this.§_-c5§.y);
         }
         else if(this.§_-b6§ && this.§_-c5§ != null)
         {
            this.setPosition(this.§_-c5§.x,this.§_-c5§.y);
         }
      }
      
      public function §_-l1v§(param1:DisplayObject, param2:Number, param3:Number, param4:Number) : void
      {
         addChild(param1);
         param1.scaleX = param1.scaleY = param2;
         param1.x = param3;
         param1.y = param4;
         update();
      }
      
      public function §_-fG§(param1:Class, param2:String, param3:Number, param4:Number, param5:Number) : void
      {
         §_-jB§.§_-fG§(this.field,param2,param1,param3,param3,param4,param5,this.isHtml,true);
         update();
      }
      
      public function get fixed() : Point
      {
         return this.§_-c5§;
      }
      
      public function set fixed(param1:Point) : void
      {
         if(param1)
         {
            this.§_-u1B§.removeEventListener(MouseEvent.MOUSE_MOVE,§_-D23§);
         }
         else
         {
            this.§_-u1B§.addEventListener(MouseEvent.MOUSE_MOVE,§_-D23§);
         }
         this.§_-c5§ = param1;
      }
      
      override protected function draw() : void
      {
         this.graphics.clear();
         this.graphics.beginFill(16777215,0.9);
         this.graphics.drawRoundRectComplex(0,0,this.width + §_-KS§,this.height + §_-w2§,§_-C3M§,§_-C3M§,§_-C3M§,§_-C3M§);
         this.graphics.endFill();
      }
      
      override protected function §_-027§(param1:MouseEvent) : void
      {
         if(!this.§_-b6§)
         {
            this.§_-B1N§(param1);
         }
         if(param1.type == MouseEvent.MOUSE_UP && Game.§_-d2t§.contains(this))
         {
            Game.§_-d2t§.removeChild(this);
         }
         if(Game.§_-d2t§.contains(this))
         {
            return;
         }
         Game.§_-d2t§.addChild(this);
         this.mouseEnabled = false;
         this.mouseChildren = false;
         this.visible = true;
      }
      
      private function §_-B1N§(param1:MouseEvent) : void
      {
         var _loc2_:Point = Game.§_-d2t§.globalToLocal(new Point(param1.stageX,param1.stageY));
         var _loc3_:Number = _loc2_.x + §_-V1x§;
         var _loc4_:Number = _loc2_.y + §_-B3f§;
         if(_loc3_ + this.width > §_-a9§.§_-9o§)
         {
            _loc3_ = _loc2_.x - this.width;
         }
         if(_loc4_ + this.height > §_-a9§.§_-31m§)
         {
            _loc4_ = _loc2_.y - this.height;
         }
         if(this.§_-c2C§(_loc3_,_loc4_,_loc2_))
         {
            _loc4_ = this.§_-i1o§(_loc4_,_loc2_);
         }
         this.x = _loc3_;
         this.y = _loc4_;
      }
      
      private function §_-c2C§(param1:Number, param2:Number, param3:Point) : Boolean
      {
         return param1 <= param3.x && param1 + this.width >= param3.x - §_-t1e§ && param2 <= param3.y && param2 + this.height >= param3.y - §_-t1e§;
      }
      
      private function §_-i1o§(param1:Number, param2:Point) : Number
      {
         param1 = param2.y + §_-t1e§;
         if(param1 + this.height > §_-a9§.§_-31m§)
         {
            param1 = param2.y - this.height - §_-t1e§;
            if(param1 < 0)
            {
               param1 = param2.y + §_-t1e§;
            }
         }
         return param1;
      }
      
      private function §_-p1t§() : void
      {
         var _loc1_:DisplayObject = null;
         for each(_loc1_ in this.§_-vG§)
         {
            if(contains(_loc1_))
            {
               removeChild(_loc1_);
            }
         }
      }
      
      private function §_-We§(param1:Array, param2:Number) : Array
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
      
      private function §_-U2Y§(param1:Array) : Number
      {
         var _loc2_:Number = 0;
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            if(_loc3_ > 0)
            {
               _loc2_ += §_-U2m§;
            }
            _loc2_ += param1[_loc3_].width;
            _loc3_++;
         }
         return _loc2_;
      }
   }
}

