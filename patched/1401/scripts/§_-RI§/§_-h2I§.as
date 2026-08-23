package §_-RI§
{
   import §_-1T§.DisplayObjectManager;
   import §_-1T§.§_-02y§;
   import §_-C1l§.§_-a2§;
   import §_-O24§.§_-l1D§;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.filters.ColorMatrixFilter;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import starling.display.DisplayObject;
   import starling.display.DisplayObjectContainer;
   import starling.display.Sprite;
   import starling.display.§_-jH§;
   import starling.display.§_-t2M§;
   import starling.filters.BlurFilter;
   import starling.filters.ColorMatrixFilter;
   import starling.textures.Texture;
   
   public dynamic class §_-h2I§ extends flash.display.Sprite implements §_-v2j§
   {
      
      private var §_-53h§:starling.display.Sprite = null;
      
      private var §_-21F§:Array = null;
      
      private var §_-P2d§:Vector.<§_-XK§>;
      
      private var §_-01r§:* = null;
      
      private var §_-I26§:Boolean = false;
      
      private var §_-J1w§:flash.display.DisplayObject = null;
      
      private var §_-2a§:§_-jH§ = null;
      
      private var §_-U2g§:int = 0;
      
      private var §_-jA§:Rectangle;
      
      private var §_-x3§:Boolean = true;
      
      private var §_-XX§:Number = 0;
      
      private var §_-dl§:Number = 0;
      
      private var §_-yw§:Number = 1;
      
      private var §_-82Q§:Number = 1;
      
      private var §_-od§:Number = 1;
      
      private var §_-v2h§:Boolean = true;
      
      public function §_-h2I§(param1:* = null, param2:Boolean = false)
      {
         var _loc3_:String = null;
         var _loc4_:Texture = null;
         this.§_-P2d§ = new Vector.<§_-XK§>();
         this.§_-jA§ = new Rectangle();
         super();
         this.§_-I26§ = false;
         this.§_-53h§ = new starling.display.Sprite();
         if(param1)
         {
            this.§_-yw§ = param1.scaleX;
            this.§_-82Q§ = param1.scaleY;
            this.§_-XX§ = param1.scaleX;
            this.§_-dl§ = param1.scaleY;
            this.§_-J1w§ = param1;
            _loc3_ = §_-a2§.§_-73c§();
            _loc4_ = §_-l1D§.instance.getTexture(this.§_-J1w§);
            if(_loc4_)
            {
               this.§_-2a§ = new §_-jH§(_loc4_);
               this.§_-I26§ = true;
            }
            else
            {
               this.§_-2a§ = §_-a2§.§_-i2y§(this.§_-J1w§,0,param1.scaleX,param1.scaleY,_loc3_,param2);
            }
            this.§_-53h§.addChild(this.§_-2a§);
         }
         else
         {
            this.§_-53h§.addChild(new starling.display.Sprite());
         }
      }
      
      public function set touchable(param1:Boolean) : void
      {
         this.§_-53h§.touchable = param1;
      }
      
      public function get touchable() : Boolean
      {
         return this.§_-53h§.touchable;
      }
      
      public function get texture() : Texture
      {
         return this.§_-2a§ ? this.§_-2a§.texture : null;
      }
      
      public function get §_-r2Q§() : Rectangle
      {
         return this.§_-53h§.§_-r2Q§;
      }
      
      public function set §_-r2Q§(param1:Rectangle) : void
      {
         this.§_-53h§.§_-r2Q§ = param1;
      }
      
      public function set §_-6i§(param1:Boolean) : void
      {
         this.§_-x3§ = param1;
      }
      
      public function get §_-6i§() : Boolean
      {
         return this.§_-x3§;
      }
      
      public function set §_-X2C§(param1:Boolean) : void
      {
         this.§_-v2h§ = param1;
      }
      
      public function get §_-X2C§() : Boolean
      {
         return this.§_-v2h§;
      }
      
      public function set localRect(param1:Rectangle) : void
      {
         this.§_-jA§ = param1;
      }
      
      public function get localRect() : Rectangle
      {
         return this.§_-jA§;
      }
      
      public function set smoothing(param1:String) : void
      {
         if(this.§_-2a§)
         {
            this.§_-2a§.smoothing = param1;
         }
      }
      
      public function set lastIndex(param1:int) : void
      {
         this.§_-U2g§ = param1;
      }
      
      public function get lastIndex() : int
      {
         return this.§_-U2g§;
      }
      
      override public function globalToLocal(param1:Point) : Point
      {
         var point:Point = param1;
         try
         {
            point = this.§_-53h§.globalToLocal(point);
         }
         catch(e:Error)
         {
            §_-TQ§.add("StarlingAdapterSprite->globalToLocal: " + e.message);
            point = new Point();
         }
         return point;
      }
      
      override public function localToGlobal(param1:Point) : Point
      {
         return this.§_-53h§.localToGlobal(param1);
      }
      
      public function getRectStarling(param1:*) : Rectangle
      {
         return this.§_-53h§.getBounds(param1);
      }
      
      public function boundsStarling() : Rectangle
      {
         return this.§_-53h§.bounds;
      }
      
      public function §_-g1s§(param1:*) : Boolean
      {
         return false;
      }
      
      public function §_-B2M§(param1:Point) : Boolean
      {
         return this.§_-53h§.hitTest(param1) != null;
      }
      
      public function §_-iu§(param1:Point, param2:Boolean = false) : *
      {
         var _loc3_:Point = this.§_-53h§.globalToLocal(param1);
         var _loc4_:Rectangle = this.§_-53h§.getBounds(this.§_-53h§);
         if(!this.§_-53h§ || _loc3_.x < _loc4_.x || _loc3_.x > _loc4_.x + _loc4_.width || _loc3_.y < _loc4_.y || _loc3_.y > _loc4_.y + _loc4_.height)
         {
            return null;
         }
         var _loc5_:uint = §_-a2§.§_-A2v§(this.§_-53h§,param1.x,param1.y);
         if(this.alpha <= 0)
         {
            return this;
         }
         if(_loc5_ > 0)
         {
            return this;
         }
         return null;
      }
      
      public function §_-c23§(param1:Rectangle, param2:Boolean = false) : *
      {
         if(param2 && (!this.§_-53h§.visible || !this.§_-53h§.touchable))
         {
            return null;
         }
         var _loc3_:Rectangle = this.§_-53h§.getBounds(this.§_-53h§);
         _loc3_.inflate(0,0);
         if(_loc3_.containsRect(param1))
         {
            return this;
         }
         return null;
      }
      
      public function §_-81O§(param1:Point, param2:Boolean = false) : *
      {
         if(param2 && (!this.§_-53h§.visible || !this.§_-53h§.touchable))
         {
            return null;
         }
         var _loc3_:Point = this.§_-53h§.globalToLocal(param1);
         var _loc4_:Point = new Point(this.§_-53h§.width * 0.5,this.§_-53h§.height * 0.5);
         var _loc5_:Number = Math.min(this.§_-53h§.width,this.§_-53h§.height) / 2;
         var _loc6_:Number = _loc3_.x - _loc4_.x;
         var _loc7_:Number = _loc3_.y - _loc4_.y;
         return _loc6_ * _loc6_ + _loc7_ * _loc7_ <= _loc5_ * _loc5_ ? this : null;
      }
      
      public function removeFromParent(param1:Boolean = true) : void
      {
         var i:int = 0;
         var item:* = undefined;
         var childDO:starling.display.DisplayObject = null;
         var dispose:Boolean = param1;
         try
         {
            if(this.§_-53h§.filter)
            {
               this.§_-53h§.filter.dispose();
               this.§_-53h§.filter = null;
            }
            if(dispose)
            {
               i = 0;
               while(i < this.§_-P2d§.length)
               {
                  item = this.§_-P2d§[i].item;
                  if(item is §_-v2j§)
                  {
                     item.removeFromParent();
                  }
                  else if(item is starling.display.DisplayObject)
                  {
                     this.§_-c2l§(item);
                  }
                  this.§_-P2d§[i] = null;
                  i++;
               }
               while(this.§_-53h§.numChildren > 0)
               {
                  childDO = this.§_-53h§.getChildAt(0);
                  this.§_-c2l§(childDO);
               }
               if(this.§_-2a§)
               {
                  this.§_-c2l§(this.§_-2a§);
               }
               this.§_-P2d§ = new Vector.<§_-XK§>();
               this.§_-J1w§ = null;
               this.§_-2a§ = null;
            }
            this.§_-01r§ = null;
            this.§_-53h§.removeFromParent(dispose);
            if(this.parent)
            {
               this.parent.removeChild(this);
            }
         }
         catch(e:Error)
         {
         }
      }
      
      private function §_-c2l§(param1:starling.display.DisplayObject) : void
      {
         var _loc3_:§_-jH§ = null;
         var _loc4_:§_-t2M§ = null;
         var _loc5_:starling.display.Sprite = null;
         var _loc2_:§_-02y§ = §_-02y§.getInstance();
         if(param1 is §_-jH§)
         {
            _loc3_ = param1 as §_-jH§;
            if(Boolean(_loc3_.texture) && !_loc2_.§_-23N§(_loc3_.texture))
            {
               _loc2_.§_-o2l§(_loc3_.texture);
            }
            DisplayObjectManager.getInstance().remove(_loc3_);
            if(_loc3_.parent)
            {
               _loc3_.removeFromParent();
            }
            _loc3_.dispose();
         }
         else if(param1 is §_-t2M§)
         {
            _loc4_ = param1 as §_-t2M§;
            if(Boolean(_loc4_.texture) && !_loc2_.§_-23N§(_loc4_.texture))
            {
               _loc4_.texture.dispose();
            }
            _loc4_.reset();
            _loc4_.dispose();
            if(_loc4_.parent)
            {
               _loc4_.removeFromParent();
            }
         }
         else if(param1 is starling.display.Sprite)
         {
            _loc5_ = param1 as starling.display.Sprite;
            while(_loc5_.numChildren > 0)
            {
               this.§_-c2l§(_loc5_.getChildAt(0));
            }
            if(_loc5_.parent)
            {
               _loc5_.removeFromParent();
            }
            _loc5_.dispose();
         }
         else
         {
            if(param1.parent)
            {
               param1.removeFromParent();
            }
            param1.dispose();
         }
      }
      
      public function set §_-Je§(param1:Boolean) : void
      {
         this.§_-53h§.useHandCursor = param1;
      }
      
      public function set pivotX(param1:Number) : void
      {
         this.§_-53h§.pivotX = param1;
      }
      
      public function get pivotY() : Number
      {
         return this.§_-53h§.pivotY;
      }
      
      public function set pivotY(param1:Number) : void
      {
         this.§_-53h§.pivotY = param1;
      }
      
      public function get pivotX() : Number
      {
         return this.§_-53h§.pivotX;
      }
      
      public function §_-x2x§(param1:String = "center", param2:String = "center") : void
      {
         this.§_-53h§.§_-x2x§(param1,param2);
      }
      
      public function §_-52Q§() : void
      {
      }
      
      override public function set blendMode(param1:String) : void
      {
         this.§_-53h§.blendMode = param1;
      }
      
      public function getStarlingView() : DisplayObjectContainer
      {
         return this.§_-53h§;
      }
      
      public function §_-d2R§(param1:*, param2:int) : void
      {
         this.setChildStarlingIndex(this.§_-83v§(param1),param2);
      }
      
      public function §_-83v§(param1:*) : *
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         if(param1 is §_-v2j§ && this.§_-ws§(param1))
         {
            param1.parentStarling = this;
            this.§_-53h§.addChild(param1.getStarlingView());
            return param1;
         }
         if(param1 is §_-v2j§)
         {
            _loc2_ = this.§_-X2C§ ? this.scaleX * param1.scaleX : Number(param1.scaleX);
            _loc3_ = this.§_-X2C§ ? this.scaleY * param1.scaleY : Number(param1.scaleY);
            §_-v2j§(param1).scaleXY(_loc2_,_loc3_);
            param1.parentStarling = this;
            this.§_-53h§.addChild(param1.getStarlingView());
         }
         else
         {
            if(this.§_-X2C§)
            {
               param1.scaleX *= this.scaleX;
               param1.scaleY *= this.scaleY;
            }
            this.§_-53h§.addChild(param1);
         }
         this.§_-P2d§.push(new §_-XK§(param1));
         return param1;
      }
      
      public function removeChildStarling(param1:*, param2:Boolean = true) : void
      {
         var _loc3_:int = -1;
         if(param1 is §_-v2j§)
         {
            _loc3_ = this.§_-53h§.getChildIndex(param1.getStarlingView()) - 1;
            param1.removeFromParent(param2);
         }
         else if(param1 is starling.display.DisplayObject)
         {
            _loc3_ = this.§_-53h§.getChildIndex(param1) - 1;
            if(_loc3_ >= 0)
            {
               DisplayObject(param1).removeFromParent(false);
            }
            if(param2)
            {
               this.§_-c2l§(param1);
            }
         }
         if(_loc3_ > -1 && _loc3_ < this.§_-P2d§.length)
         {
            this.§_-P2d§.splice(_loc3_,1);
         }
         if(!(param1 is §_-v2j§) && param1 is flash.display.DisplayObject && this.contains(param1))
         {
            this.removeChild(param1);
         }
      }
      
      override public function set scaleX(param1:Number) : void
      {
         if(this.§_-yw§ == param1 && this.§_-53h§.scaleX == param1)
         {
            return;
         }
         this.§_-yw§ = param1;
         if(Boolean(this.§_-J1w§) && this.§_-x3§)
         {
            this.§_-Xm§();
         }
         if(this.§_-I26§ == false && !this.§_-J1w§)
         {
            this.§_-53h§.scaleX = param1;
         }
         else
         {
            this.§_-p1T§();
         }
      }
      
      override public function set scaleY(param1:Number) : void
      {
         if(this.§_-82Q§ == param1 && this.§_-53h§.scaleY == param1)
         {
            return;
         }
         this.§_-82Q§ = param1;
         if(Boolean(this.§_-J1w§) && this.§_-x3§)
         {
            this.§_-Xm§();
         }
         if(this.§_-I26§ == false && !this.§_-J1w§)
         {
            this.§_-53h§.scaleY = param1;
         }
         else
         {
            this.§_-p1T§();
         }
      }
      
      public function scaleXY(param1:Number, param2:Number = 0) : void
      {
         if(param2 == 0)
         {
            param2 = param1;
         }
         if(this.§_-yw§ == param1 && this.§_-82Q§ == param2)
         {
            return;
         }
         this.§_-yw§ = param1;
         this.§_-82Q§ = param2;
         if(Boolean(this.§_-J1w§) && this.§_-x3§)
         {
            this.§_-Xm§();
         }
         this.§_-p1T§();
      }
      
      public function set scaleFlashX(param1:Number) : void
      {
         super.scaleX = param1;
      }
      
      public function set scaleFlashY(param1:Number) : void
      {
         super.scaleY = param1;
      }
      
      override public function get scaleX() : Number
      {
         return this.§_-yw§;
      }
      
      override public function get scaleY() : Number
      {
         return this.§_-82Q§;
      }
      
      override public function set x(param1:Number) : void
      {
         super.x = Math.round(param1);
         this.§_-53h§.x = Math.round(param1);
      }
      
      override public function set y(param1:Number) : void
      {
         super.y = Math.round(param1);
         this.§_-53h§.y = Math.round(param1);
      }
      
      override public function set alpha(param1:Number) : void
      {
         this.§_-od§ = this.§_-53h§.alpha = param1;
      }
      
      override public function get alpha() : Number
      {
         return this.§_-od§;
      }
      
      override public function set visible(param1:Boolean) : void
      {
         super.visible = param1;
         this.§_-53h§.visible = param1;
      }
      
      override public function get visible() : Boolean
      {
         return this.§_-53h§.visible;
      }
      
      public function get §_-C20§() : Number
      {
         return this.§_-53h§.alpha;
      }
      
      public function §_-gS§() : void
      {
         if(this.§_-53h§.alpha > 0)
         {
            this.§_-53h§.alpha = 0;
         }
      }
      
      public function §_-IB§() : void
      {
         if(this.§_-od§ > 0)
         {
            this.§_-53h§.alpha = this.§_-od§;
         }
      }
      
      override public function set rotation(param1:Number) : void
      {
         super.rotation = param1;
         this.§_-53h§.rotation = param1 * Math.PI / 180;
      }
      
      override public function get rotation() : Number
      {
         return super.rotation;
      }
      
      override public function get width() : Number
      {
         return this.§_-53h§.width;
      }
      
      override public function get height() : Number
      {
         return this.§_-53h§.height;
      }
      
      public function §_-ws§(param1:*) : Boolean
      {
         if(param1 is §_-v2j§)
         {
            return this.§_-53h§.contains(param1.getStarlingView());
         }
         return false;
      }
      
      override public function get filters() : Array
      {
         return this.§_-21F§ != null ? this.§_-21F§ : [];
      }
      
      override public function set filters(param1:Array) : void
      {
         var cm:starling.filters.ColorMatrixFilter = null;
         var bf:BlurFilter = null;
         var value:Array = param1;
         this.§_-21F§ = value;
         try
         {
            if(this.§_-53h§.filter)
            {
               this.§_-53h§.filter.dispose();
               this.§_-53h§.filter = null;
            }
            if(value[0] is BlurFilter || value[0] is starling.filters.ColorMatrixFilter)
            {
               this.§_-53h§.filter = value[0];
            }
            else if(value[0] is flash.filters.ColorMatrixFilter)
            {
               cm = new starling.filters.ColorMatrixFilter();
               cm.matrix = Vector.<Number>((value[0] as flash.filters.ColorMatrixFilter).matrix);
               this.§_-53h§.filter = cm;
            }
            else if(Boolean(typeof value[0] == "object") && Boolean(value[0].color) && Boolean(value[0].alpha) && Boolean(value[0].quality))
            {
               bf = BlurFilter.§_-q2e§(value[0].color,value[0].alpha,value[0].blurX,value[0].quality);
               bf.blurX = value[0].blurX;
               bf.blurY = value[0].blurY;
               this.§_-53h§.filter = bf;
            }
         }
         catch(e:Error)
         {
         }
      }
      
      override public function get numChildren() : int
      {
         var _loc1_:int = 0;
         _loc1_ = int(this.§_-P2d§.length);
         if(_loc1_ < this.§_-53h§.numChildren - 1)
         {
            _loc1_ = this.§_-53h§.numChildren - 1;
         }
         if(Boolean(super.numChildren) && _loc1_ < super.numChildren)
         {
            _loc1_ = super.numChildren;
         }
         return _loc1_;
      }
      
      public function get parentStarling() : *
      {
         return this.§_-01r§;
      }
      
      public function set parentStarling(param1:*) : void
      {
         this.§_-01r§ = param1;
      }
      
      public function getChildStarlingIndex(param1:*, param2:Boolean = false) : int
      {
         if(param1 is §_-v2j§)
         {
            if(!param1.getStarlingView().parent && !param2)
            {
               return param1.lastIndex;
            }
            param1 = param1.getStarlingView();
         }
         return this.§_-53h§.getChildIndex(param1);
      }
      
      public function setChildStarlingIndex(param1:*, param2:int) : void
      {
         var _loc4_:§_-XK§ = null;
         if(param1 is §_-v2j§)
         {
            param1 = param1.getStarlingView();
         }
         var _loc3_:int = this.§_-53h§.getChildIndex(param1) - 1;
         if(_loc3_ > -1 && _loc3_ < this.§_-P2d§.length)
         {
            _loc4_ = this.§_-P2d§.splice(_loc3_,1)[0];
            this.§_-P2d§.splice(param2,0,_loc4_);
         }
         else
         {
            this.§_-P2d§.splice(param2,0,new §_-XK§(param1));
         }
         this.§_-53h§.setChildIndex(param1,param2);
         this.§_-U2g§ = param2;
      }
      
      public function §_-ek§(param1:int) : *
      {
         if(param1 < this.§_-P2d§.length)
         {
            return this.§_-P2d§[param1].item;
         }
         if(param1 < super.numChildren)
         {
            return super.getChildAt(param1);
         }
         return null;
      }
      
      public function §_-n2T§(param1:int, param2:Boolean = true) : starling.display.DisplayObject
      {
         var _loc3_:* = undefined;
         if(param1 < 0)
         {
            return null;
         }
         if(param1 < this.§_-P2d§.length)
         {
            _loc3_ = this.§_-P2d§.splice(param1,1)[0].item;
         }
         else if(param1 < this.§_-53h§.numChildren)
         {
            _loc3_ = this.§_-53h§.getChildAt(param1);
         }
         else if(super.numChildren > param1)
         {
            super.removeChildAt(param1);
            return null;
         }
         if(_loc3_ is §_-v2j§)
         {
            _loc3_.removeFromParent(param2);
         }
         else if(_loc3_ is starling.display.DisplayObject && param2)
         {
            this.§_-c2l§(_loc3_);
         }
         return null;
      }
      
      override public function removeChildAt(param1:int) : flash.display.DisplayObject
      {
         var index:int = param1;
         try
         {
            return index < super.numChildren ? super.removeChildAt(index) : null;
         }
         catch(e:Error)
         {
         }
         return null;
      }
      
      override public function getChildAt(param1:int) : flash.display.DisplayObject
      {
         var index:int = param1;
         try
         {
            if(!super.numChildren)
            {
               return null;
            }
            return super.getChildAt(index);
         }
         catch(e:Error)
         {
         }
         return null;
      }
      
      public function §_-j2Z§() : int
      {
         return super.numChildren;
      }
      
      override public function addChild(param1:flash.display.DisplayObject) : flash.display.DisplayObject
      {
         var child:flash.display.DisplayObject = param1;
         try
         {
            return super.contains(child) ? child : super.addChildAt(child,super.numChildren);
         }
         catch(e:Error)
         {
         }
         return null;
      }
      
      override public function removeChild(param1:flash.display.DisplayObject) : flash.display.DisplayObject
      {
         var child:flash.display.DisplayObject = param1;
         try
         {
            super.removeChild(child);
         }
         catch(e:Error)
         {
         }
         return child;
      }
      
      private function §_-Xm§() : void
      {
         if(!this.§_-2a§)
         {
            return;
         }
         if(this.§_-XX§ == this.§_-yw§ && this.§_-dl§ == this.§_-82Q§)
         {
            return;
         }
         this.§_-XX§ = this.§_-yw§;
         this.§_-dl§ = this.§_-82Q§;
         if(!this.§_-I26§)
         {
            this.§_-53h§.removeChild(this.§_-2a§);
            this.§_-c2l§(this.§_-2a§);
            this.§_-l13§();
         }
         else
         {
            this.§_-2a§.scaleX = this.§_-yw§;
            this.§_-2a§.scaleY = this.§_-82Q§;
         }
      }
      
      public function §_-l13§() : void
      {
         this.§_-2a§ = §_-a2§.§_-i2y§(this.§_-J1w§,0,this.§_-yw§,this.§_-82Q§,§_-a2§.§_-73c§(),true);
         this.§_-53h§.addChild(this.§_-2a§);
      }
      
      public function §_-p1T§() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.§_-P2d§.length)
         {
            if(this.§_-P2d§[_loc1_].item.scaleX != this.§_-yw§ || this.§_-53h§.scaleX != this.§_-P2d§[_loc1_].item.scaleX)
            {
               this.§_-P2d§[_loc1_].item.scaleX = this.§_-yw§;
            }
            if(this.§_-P2d§[_loc1_].item.scaleY != this.§_-82Q§ || this.§_-53h§.scaleY != this.§_-P2d§[_loc1_].item.scaleY)
            {
               this.§_-P2d§[_loc1_].item.scaleY = this.§_-82Q§;
            }
            _loc1_++;
         }
      }
      
      public function play() : void
      {
      }
   }
}

