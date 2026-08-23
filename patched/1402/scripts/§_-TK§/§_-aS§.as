package §_-TK§
{
   import §_-B37§.§_-Y7§;
   import §_-Mq§.DisplayObjectManager;
   import §_-Mq§.§_-23h§;
   import §_-hd§.§_-01M§;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.filters.ColorMatrixFilter;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import starling.display.DisplayObject;
   import starling.display.DisplayObjectContainer;
   import starling.display.Sprite;
   import starling.display.§_-81s§;
   import starling.display.§_-I2q§;
   import starling.filters.BlurFilter;
   import starling.filters.ColorMatrixFilter;
   import starling.textures.Texture;
   
   public dynamic class §_-aS§ extends flash.display.Sprite implements §_-51g§
   {
      
      private var §_-x2o§:starling.display.Sprite = null;
      
      private var §_-J1L§:Array = null;
      
      private var §_-T1I§:Vector.<§_-Z1n§>;
      
      private var §_-J1T§:* = null;
      
      private var §_-Ah§:Boolean = false;
      
      private var §_-63R§:flash.display.DisplayObject = null;
      
      private var §_-xB§:§_-I2q§ = null;
      
      private var §_-E2t§:int = 0;
      
      private var §_-u28§:Rectangle;
      
      private var §_-c4§:Boolean = true;
      
      private var §_-S2e§:Number = 0;
      
      private var §_-l2N§:Number = 0;
      
      private var §_-qn§:Number = 1;
      
      private var §_-ky§:Number = 1;
      
      private var §_-O1k§:Number = 1;
      
      private var §_-C3V§:Boolean = true;
      
      public function §_-aS§(param1:* = null, param2:Boolean = false)
      {
         var _loc3_:String = null;
         var _loc4_:Texture = null;
         this.§_-T1I§ = new Vector.<§_-Z1n§>();
         this.§_-u28§ = new Rectangle();
         super();
         this.§_-Ah§ = false;
         this.§_-x2o§ = new starling.display.Sprite();
         if(param1)
         {
            this.§_-qn§ = param1.scaleX;
            this.§_-ky§ = param1.scaleY;
            this.§_-S2e§ = param1.scaleX;
            this.§_-l2N§ = param1.scaleY;
            this.§_-63R§ = param1;
            _loc3_ = §_-01M§.§_-Y1u§();
            _loc4_ = §_-Y7§.instance.getTexture(this.§_-63R§);
            if(_loc4_)
            {
               this.§_-xB§ = new §_-I2q§(_loc4_);
               this.§_-Ah§ = true;
            }
            else
            {
               this.§_-xB§ = §_-01M§.§_-Z1V§(this.§_-63R§,0,param1.scaleX,param1.scaleY,_loc3_,param2);
            }
            this.§_-x2o§.addChild(this.§_-xB§);
         }
         else
         {
            this.§_-x2o§.addChild(new starling.display.Sprite());
         }
      }
      
      public function set touchable(param1:Boolean) : void
      {
         this.§_-x2o§.touchable = param1;
      }
      
      public function get touchable() : Boolean
      {
         return this.§_-x2o§.touchable;
      }
      
      public function get texture() : Texture
      {
         return this.§_-xB§ ? this.§_-xB§.texture : null;
      }
      
      public function get §_-51s§() : Rectangle
      {
         return this.§_-x2o§.§_-51s§;
      }
      
      public function set §_-51s§(param1:Rectangle) : void
      {
         this.§_-x2o§.§_-51s§ = param1;
      }
      
      public function set §_-dv§(param1:Boolean) : void
      {
         this.§_-c4§ = param1;
      }
      
      public function get §_-dv§() : Boolean
      {
         return this.§_-c4§;
      }
      
      public function set §_-920§(param1:Boolean) : void
      {
         this.§_-C3V§ = param1;
      }
      
      public function get §_-920§() : Boolean
      {
         return this.§_-C3V§;
      }
      
      public function set localRect(param1:Rectangle) : void
      {
         this.§_-u28§ = param1;
      }
      
      public function get localRect() : Rectangle
      {
         return this.§_-u28§;
      }
      
      public function set smoothing(param1:String) : void
      {
         if(this.§_-xB§)
         {
            this.§_-xB§.smoothing = param1;
         }
      }
      
      public function set lastIndex(param1:int) : void
      {
         this.§_-E2t§ = param1;
      }
      
      public function get lastIndex() : int
      {
         return this.§_-E2t§;
      }
      
      override public function globalToLocal(param1:Point) : Point
      {
         var point:Point = param1;
         try
         {
            point = this.§_-x2o§.globalToLocal(point);
         }
         catch(e:Error)
         {
            §_-p2U§.add("StarlingAdapterSprite->globalToLocal: " + e.message);
            point = new Point();
         }
         return point;
      }
      
      override public function localToGlobal(param1:Point) : Point
      {
         return this.§_-x2o§.localToGlobal(param1);
      }
      
      public function getRectStarling(param1:*) : Rectangle
      {
         return this.§_-x2o§.getBounds(param1);
      }
      
      public function boundsStarling() : Rectangle
      {
         return this.§_-x2o§.bounds;
      }
      
      public function §_-p1A§(param1:*) : Boolean
      {
         return false;
      }
      
      public function §_-Jz§(param1:Point) : Boolean
      {
         return this.§_-x2o§.hitTest(param1) != null;
      }
      
      public function §_-31u§(param1:Point, param2:Boolean = false) : *
      {
         var _loc3_:Point = this.§_-x2o§.globalToLocal(param1);
         var _loc4_:Rectangle = this.§_-x2o§.getBounds(this.§_-x2o§);
         if(!this.§_-x2o§ || _loc3_.x < _loc4_.x || _loc3_.x > _loc4_.x + _loc4_.width || _loc3_.y < _loc4_.y || _loc3_.y > _loc4_.y + _loc4_.height)
         {
            return null;
         }
         var _loc5_:uint = §_-01M§.§_-G2E§(this.§_-x2o§,param1.x,param1.y);
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
      
      public function §_-T2w§(param1:Rectangle, param2:Boolean = false) : *
      {
         if(param2 && (!this.§_-x2o§.visible || !this.§_-x2o§.touchable))
         {
            return null;
         }
         var _loc3_:Rectangle = this.§_-x2o§.getBounds(this.§_-x2o§);
         _loc3_.inflate(0,0);
         if(_loc3_.containsRect(param1))
         {
            return this;
         }
         return null;
      }
      
      public function §_-N2S§(param1:Point, param2:Boolean = false) : *
      {
         if(param2 && (!this.§_-x2o§.visible || !this.§_-x2o§.touchable))
         {
            return null;
         }
         var _loc3_:Point = this.§_-x2o§.globalToLocal(param1);
         var _loc4_:Point = new Point(this.§_-x2o§.width * 0.5,this.§_-x2o§.height * 0.5);
         var _loc5_:Number = Math.min(this.§_-x2o§.width,this.§_-x2o§.height) / 2;
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
            if(this.§_-x2o§.filter)
            {
               this.§_-x2o§.filter.dispose();
               this.§_-x2o§.filter = null;
            }
            if(dispose)
            {
               i = 0;
               while(i < this.§_-T1I§.length)
               {
                  item = this.§_-T1I§[i].item;
                  if(item is §_-51g§)
                  {
                     item.removeFromParent();
                  }
                  else if(item is starling.display.DisplayObject)
                  {
                     this.§_-ZN§(item);
                  }
                  this.§_-T1I§[i] = null;
                  i++;
               }
               while(this.§_-x2o§.numChildren > 0)
               {
                  childDO = this.§_-x2o§.getChildAt(0);
                  this.§_-ZN§(childDO);
               }
               if(this.§_-xB§)
               {
                  this.§_-ZN§(this.§_-xB§);
               }
               this.§_-T1I§ = new Vector.<§_-Z1n§>();
               this.§_-63R§ = null;
               this.§_-xB§ = null;
            }
            this.§_-J1T§ = null;
            this.§_-x2o§.removeFromParent(dispose);
            if(this.parent)
            {
               this.parent.removeChild(this);
            }
         }
         catch(e:Error)
         {
         }
      }
      
      private function §_-ZN§(param1:starling.display.DisplayObject) : void
      {
         var _loc3_:§_-I2q§ = null;
         var _loc4_:§_-81s§ = null;
         var _loc5_:starling.display.Sprite = null;
         var _loc2_:§_-23h§ = §_-23h§.getInstance();
         if(param1 is §_-I2q§)
         {
            _loc3_ = param1 as §_-I2q§;
            if(Boolean(_loc3_.texture) && !_loc2_.§_-hk§(_loc3_.texture))
            {
               _loc2_.§_-rp§(_loc3_.texture);
            }
            DisplayObjectManager.getInstance().remove(_loc3_);
            if(_loc3_.parent)
            {
               _loc3_.removeFromParent();
            }
            _loc3_.dispose();
         }
         else if(param1 is §_-81s§)
         {
            _loc4_ = param1 as §_-81s§;
            if(Boolean(_loc4_.texture) && !_loc2_.§_-hk§(_loc4_.texture))
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
               this.§_-ZN§(_loc5_.getChildAt(0));
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
      
      public function set §_-r2a§(param1:Boolean) : void
      {
         this.§_-x2o§.useHandCursor = param1;
      }
      
      public function set pivotX(param1:Number) : void
      {
         this.§_-x2o§.pivotX = param1;
      }
      
      public function get pivotY() : Number
      {
         return this.§_-x2o§.pivotY;
      }
      
      public function set pivotY(param1:Number) : void
      {
         this.§_-x2o§.pivotY = param1;
      }
      
      public function get pivotX() : Number
      {
         return this.§_-x2o§.pivotX;
      }
      
      public function §_-i18§(param1:String = "center", param2:String = "center") : void
      {
         this.§_-x2o§.§_-i18§(param1,param2);
      }
      
      public function §_-r1U§() : void
      {
      }
      
      override public function set blendMode(param1:String) : void
      {
         this.§_-x2o§.blendMode = param1;
      }
      
      public function getStarlingView() : DisplayObjectContainer
      {
         return this.§_-x2o§;
      }
      
      public function §_-D2f§(param1:*, param2:int) : void
      {
         this.setChildStarlingIndex(this.§_-J2J§(param1),param2);
      }
      
      public function §_-J2J§(param1:*) : *
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         if(param1 is §_-51g§ && this.§_-U2E§(param1))
         {
            param1.parentStarling = this;
            this.§_-x2o§.addChild(param1.getStarlingView());
            return param1;
         }
         if(param1 is §_-51g§)
         {
            _loc2_ = this.§_-920§ ? this.scaleX * param1.scaleX : Number(param1.scaleX);
            _loc3_ = this.§_-920§ ? this.scaleY * param1.scaleY : Number(param1.scaleY);
            §_-51g§(param1).scaleXY(_loc2_,_loc3_);
            param1.parentStarling = this;
            this.§_-x2o§.addChild(param1.getStarlingView());
         }
         else
         {
            if(this.§_-920§)
            {
               param1.scaleX *= this.scaleX;
               param1.scaleY *= this.scaleY;
            }
            this.§_-x2o§.addChild(param1);
         }
         this.§_-T1I§.push(new §_-Z1n§(param1));
         return param1;
      }
      
      public function removeChildStarling(param1:*, param2:Boolean = true) : void
      {
         var _loc3_:int = -1;
         if(param1 is §_-51g§)
         {
            _loc3_ = this.§_-x2o§.getChildIndex(param1.getStarlingView()) - 1;
            param1.removeFromParent(param2);
         }
         else if(param1 is starling.display.DisplayObject)
         {
            _loc3_ = this.§_-x2o§.getChildIndex(param1) - 1;
            if(_loc3_ >= 0)
            {
               DisplayObject(param1).removeFromParent(false);
            }
            if(param2)
            {
               this.§_-ZN§(param1);
            }
         }
         if(_loc3_ > -1 && _loc3_ < this.§_-T1I§.length)
         {
            this.§_-T1I§.splice(_loc3_,1);
         }
         if(!(param1 is §_-51g§) && param1 is flash.display.DisplayObject && this.contains(param1))
         {
            this.removeChild(param1);
         }
      }
      
      override public function set scaleX(param1:Number) : void
      {
         if(this.§_-qn§ == param1 && this.§_-x2o§.scaleX == param1)
         {
            return;
         }
         this.§_-qn§ = param1;
         if(Boolean(this.§_-63R§) && this.§_-c4§)
         {
            this.§_-o3§();
         }
         if(this.§_-Ah§ == false && !this.§_-63R§)
         {
            this.§_-x2o§.scaleX = param1;
         }
         else
         {
            this.§_-ko§();
         }
      }
      
      override public function set scaleY(param1:Number) : void
      {
         if(this.§_-ky§ == param1 && this.§_-x2o§.scaleY == param1)
         {
            return;
         }
         this.§_-ky§ = param1;
         if(Boolean(this.§_-63R§) && this.§_-c4§)
         {
            this.§_-o3§();
         }
         if(this.§_-Ah§ == false && !this.§_-63R§)
         {
            this.§_-x2o§.scaleY = param1;
         }
         else
         {
            this.§_-ko§();
         }
      }
      
      public function scaleXY(param1:Number, param2:Number = 0) : void
      {
         if(param2 == 0)
         {
            param2 = param1;
         }
         if(this.§_-qn§ == param1 && this.§_-ky§ == param2)
         {
            return;
         }
         this.§_-qn§ = param1;
         this.§_-ky§ = param2;
         if(Boolean(this.§_-63R§) && this.§_-c4§)
         {
            this.§_-o3§();
         }
         this.§_-ko§();
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
         return this.§_-qn§;
      }
      
      override public function get scaleY() : Number
      {
         return this.§_-ky§;
      }
      
      override public function set x(param1:Number) : void
      {
         super.x = Math.round(param1);
         this.§_-x2o§.x = Math.round(param1);
      }
      
      override public function set y(param1:Number) : void
      {
         super.y = Math.round(param1);
         this.§_-x2o§.y = Math.round(param1);
      }
      
      override public function set alpha(param1:Number) : void
      {
         this.§_-O1k§ = this.§_-x2o§.alpha = param1;
      }
      
      override public function get alpha() : Number
      {
         return this.§_-O1k§;
      }
      
      override public function set visible(param1:Boolean) : void
      {
         super.visible = param1;
         this.§_-x2o§.visible = param1;
      }
      
      override public function get visible() : Boolean
      {
         return this.§_-x2o§.visible;
      }
      
      public function get §_-43E§() : Number
      {
         return this.§_-x2o§.alpha;
      }
      
      public function §_-vb§() : void
      {
         if(this.§_-x2o§.alpha > 0)
         {
            this.§_-x2o§.alpha = 0;
         }
      }
      
      public function §_-w2o§() : void
      {
         if(this.§_-O1k§ > 0)
         {
            this.§_-x2o§.alpha = this.§_-O1k§;
         }
      }
      
      override public function set rotation(param1:Number) : void
      {
         super.rotation = param1;
         this.§_-x2o§.rotation = param1 * Math.PI / 180;
      }
      
      override public function get rotation() : Number
      {
         return super.rotation;
      }
      
      override public function get width() : Number
      {
         return this.§_-x2o§.width;
      }
      
      override public function get height() : Number
      {
         return this.§_-x2o§.height;
      }
      
      public function §_-U2E§(param1:*) : Boolean
      {
         if(param1 is §_-51g§)
         {
            return this.§_-x2o§.contains(param1.getStarlingView());
         }
         return false;
      }
      
      override public function get filters() : Array
      {
         return this.§_-J1L§ != null ? this.§_-J1L§ : [];
      }
      
      override public function set filters(param1:Array) : void
      {
         var cm:starling.filters.ColorMatrixFilter = null;
         var bf:BlurFilter = null;
         var value:Array = param1;
         this.§_-J1L§ = value;
         try
         {
            if(this.§_-x2o§.filter)
            {
               this.§_-x2o§.filter.dispose();
               this.§_-x2o§.filter = null;
            }
            if(value[0] is BlurFilter || value[0] is starling.filters.ColorMatrixFilter)
            {
               this.§_-x2o§.filter = value[0];
            }
            else if(value[0] is flash.filters.ColorMatrixFilter)
            {
               cm = new starling.filters.ColorMatrixFilter();
               cm.matrix = Vector.<Number>((value[0] as flash.filters.ColorMatrixFilter).matrix);
               this.§_-x2o§.filter = cm;
            }
            else if(Boolean(typeof value[0] == "object") && Boolean(value[0].color) && Boolean(value[0].alpha) && Boolean(value[0].quality))
            {
               bf = BlurFilter.§_-J23§(value[0].color,value[0].alpha,value[0].blurX,value[0].quality);
               bf.blurX = value[0].blurX;
               bf.blurY = value[0].blurY;
               this.§_-x2o§.filter = bf;
            }
         }
         catch(e:Error)
         {
         }
      }
      
      override public function get numChildren() : int
      {
         var _loc1_:int = 0;
         _loc1_ = int(this.§_-T1I§.length);
         if(_loc1_ < this.§_-x2o§.numChildren - 1)
         {
            _loc1_ = this.§_-x2o§.numChildren - 1;
         }
         if(Boolean(super.numChildren) && _loc1_ < super.numChildren)
         {
            _loc1_ = super.numChildren;
         }
         return _loc1_;
      }
      
      public function get parentStarling() : *
      {
         return this.§_-J1T§;
      }
      
      public function set parentStarling(param1:*) : void
      {
         this.§_-J1T§ = param1;
      }
      
      public function getChildStarlingIndex(param1:*, param2:Boolean = false) : int
      {
         if(param1 is §_-51g§)
         {
            if(!param1.getStarlingView().parent && !param2)
            {
               return param1.lastIndex;
            }
            param1 = param1.getStarlingView();
         }
         return this.§_-x2o§.getChildIndex(param1);
      }
      
      public function setChildStarlingIndex(param1:*, param2:int) : void
      {
         var _loc4_:§_-Z1n§ = null;
         if(param1 is §_-51g§)
         {
            param1 = param1.getStarlingView();
         }
         var _loc3_:int = this.§_-x2o§.getChildIndex(param1) - 1;
         if(_loc3_ > -1 && _loc3_ < this.§_-T1I§.length)
         {
            _loc4_ = this.§_-T1I§.splice(_loc3_,1)[0];
            this.§_-T1I§.splice(param2,0,_loc4_);
         }
         else
         {
            this.§_-T1I§.splice(param2,0,new §_-Z1n§(param1));
         }
         this.§_-x2o§.setChildIndex(param1,param2);
         this.§_-E2t§ = param2;
      }
      
      public function §_-kD§(param1:int) : *
      {
         if(param1 < this.§_-T1I§.length)
         {
            return this.§_-T1I§[param1].item;
         }
         if(param1 < super.numChildren)
         {
            return super.getChildAt(param1);
         }
         return null;
      }
      
      public function §_-av§(param1:int, param2:Boolean = true) : starling.display.DisplayObject
      {
         var _loc3_:* = undefined;
         if(param1 < 0)
         {
            return null;
         }
         if(param1 < this.§_-T1I§.length)
         {
            _loc3_ = this.§_-T1I§.splice(param1,1)[0].item;
         }
         else if(param1 < this.§_-x2o§.numChildren)
         {
            _loc3_ = this.§_-x2o§.getChildAt(param1);
         }
         else if(super.numChildren > param1)
         {
            super.removeChildAt(param1);
            return null;
         }
         if(_loc3_ is §_-51g§)
         {
            _loc3_.removeFromParent(param2);
         }
         else if(_loc3_ is starling.display.DisplayObject && param2)
         {
            this.§_-ZN§(_loc3_);
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
      
      public function §_-Hr§() : int
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
      
      private function §_-o3§() : void
      {
         if(!this.§_-xB§)
         {
            return;
         }
         if(this.§_-S2e§ == this.§_-qn§ && this.§_-l2N§ == this.§_-ky§)
         {
            return;
         }
         this.§_-S2e§ = this.§_-qn§;
         this.§_-l2N§ = this.§_-ky§;
         if(!this.§_-Ah§)
         {
            this.§_-x2o§.removeChild(this.§_-xB§);
            this.§_-ZN§(this.§_-xB§);
            this.§_-ZU§();
         }
         else
         {
            this.§_-xB§.scaleX = this.§_-qn§;
            this.§_-xB§.scaleY = this.§_-ky§;
         }
      }
      
      public function §_-ZU§() : void
      {
         this.§_-xB§ = §_-01M§.§_-Z1V§(this.§_-63R§,0,this.§_-qn§,this.§_-ky§,§_-01M§.§_-Y1u§(),true);
         this.§_-x2o§.addChild(this.§_-xB§);
      }
      
      public function §_-ko§() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.§_-T1I§.length)
         {
            if(this.§_-T1I§[_loc1_].item.scaleX != this.§_-qn§ || this.§_-x2o§.scaleX != this.§_-T1I§[_loc1_].item.scaleX)
            {
               this.§_-T1I§[_loc1_].item.scaleX = this.§_-qn§;
            }
            if(this.§_-T1I§[_loc1_].item.scaleY != this.§_-ky§ || this.§_-x2o§.scaleY != this.§_-T1I§[_loc1_].item.scaleY)
            {
               this.§_-T1I§[_loc1_].item.scaleY = this.§_-ky§;
            }
            _loc1_++;
         }
      }
      
      public function play() : void
      {
      }
   }
}

