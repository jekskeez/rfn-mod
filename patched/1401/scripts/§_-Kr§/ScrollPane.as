package §_-Kr§
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   
   public class ScrollPane extends Sprite
   {
      
      public static const §_-W24§:int = 8;
      
      private static const §_-1L§:int = 30;
      
      private static const §_-48§:int = 20;
      
      private static const §_-U1x§:uint = 15261912;
      
      private static const §_-i17§:uint = 12891552;
      
      private static const §_-r2c§:int = 3;
      
      private static const §_-J1n§:Number = 3;
      
      private var §_-KT§:Sprite;
      
      private var content:DisplayObject;
      
      private var §_-B1Z§:int = 100;
      
      private var §_-oC§:int = 100;
      
      private var §_-9j§:int;
      
      private var §_-61O§:int = 30;
      
      private var §_-y1P§:int = 30;
      
      private var §_-X1Z§:uint = 15261912;
      
      private var §_-oD§:uint = 12891552;
      
      private var §_-7o§:Number = 1;
      
      private var §_-g17§:Number = 1;
      
      private var §_-R1f§:int = 0;
      
      private var §_-X1a§:int = 0;
      
      private var §_-m1F§:int = 0;
      
      private var §_-L1s§:int = 0;
      
      private var §_-vH§:Sprite;
      
      private var §_-l2P§:Sprite;
      
      private var §_-r2C§:Sprite;
      
      private var §_-7X§:Number = 0;
      
      private var §_-B32§:Boolean = false;
      
      private var §_-D7§:Sprite;
      
      private var §_-b1k§:Sprite;
      
      private var §_-sm§:Sprite;
      
      private var §_-9O§:Number = 0;
      
      private var §_-bU§:Boolean = false;
      
      private var §_-12f§:Number = 0;
      
      private var §_-82y§:Number = 0;
      
      private var §_-n1K§:int = 0;
      
      private var §_-32H§:int = 0;
      
      private var §_-J1H§:Boolean = false;
      
      private var §_-L2W§:Boolean = false;
      
      private var §_-T2q§:Boolean = false;
      
      public function ScrollPane(param1:int = 8)
      {
         super();
         this.§_-9j§ = param1;
         this.§_-KT§ = new Sprite();
         this.§_-KT§.scrollRect = new Rectangle(0,0,this.§_-B1Z§,this.§_-oC§);
         this.§_-H1R§();
         addChild(this.§_-KT§);
         this.§_-j2o§();
         addEventListener(MouseEvent.MOUSE_WHEEL,this.§_-l2a§,false,0,true);
         addEventListener(MouseEvent.MOUSE_DOWN,this.§_-G1S§,false,0,true);
         addEventListener(Event.ADDED_TO_STAGE,this.§_-1V§,false,0,true);
         addEventListener(Event.REMOVED_FROM_STAGE,this.§_-72u§,false,0,true);
         this.§_-lW§();
         this.§_-l23§();
      }
      
      override public function get width() : Number
      {
         return this.§_-B1Z§;
      }
      
      override public function set width(param1:Number) : void
      {
         this.setSize(int(param1),this.§_-oC§);
      }
      
      override public function get height() : Number
      {
         return this.§_-oC§;
      }
      
      override public function set height(param1:Number) : void
      {
         this.setSize(this.§_-B1Z§,int(param1));
      }
      
      public function get source() : DisplayObject
      {
         return this.content;
      }
      
      public function set source(param1:DisplayObject) : void
      {
         if(Boolean(this.content) && this.content.parent == this.§_-KT§)
         {
            this.§_-KT§.removeChild(this.content);
         }
         this.content = param1;
         if(this.content)
         {
            this.§_-KT§.addChildAt(this.content,0);
         }
         this.update();
      }
      
      public function setSize(param1:int, param2:int) : void
      {
         param1 = Math.max(0,param1);
         param2 = Math.max(0,param2);
         if(this.§_-B1Z§ == param1 && this.§_-oC§ == param2)
         {
            return;
         }
         this.§_-B1Z§ = param1;
         this.§_-oC§ = param2;
         this.§_-KT§.scrollRect = new Rectangle(0,0,param1,param2);
         this.§_-H1R§();
         this.§_-vH§.x = param1 - this.§_-9j§;
         this.§_-D7§.y = param2 - this.§_-9j§;
         this.§_-lW§();
         this.§_-1U§(this.§_-m1F§,this.§_-L1s§);
      }
      
      public function §_-v2w§(param1:uint, param2:Number = 1) : void
      {
         this.§_-X1Z§ = param1;
         this.§_-7o§ = param2;
         this.§_-lW§();
      }
      
      public function §_-cD§(param1:uint, param2:Number = 1) : void
      {
         this.§_-oD§ = param1;
         this.§_-g17§ = param2;
         this.§_-lW§();
      }
      
      public function update() : void
      {
         var _loc1_:Rectangle = null;
         if(this.content)
         {
            _loc1_ = this.content.getRect(this.content);
            this.§_-R1f§ = Math.max(0,Math.ceil(_loc1_.right));
            this.§_-X1a§ = Math.max(0,Math.ceil(_loc1_.bottom));
         }
         else
         {
            this.§_-R1f§ = 0;
            this.§_-X1a§ = 0;
         }
         this.§_-1U§(this.§_-m1F§,this.§_-L1s§);
         this.§_-lW§();
         this.§_-l23§();
      }
      
      public function get verticalScrollPosition() : Number
      {
         return this.§_-L1s§;
      }
      
      public function set verticalScrollPosition(param1:Number) : void
      {
         this.§_-1U§(this.§_-m1F§,int(param1));
      }
      
      public function get horizontalScrollPosition() : Number
      {
         return this.§_-m1F§;
      }
      
      public function set horizontalScrollPosition(param1:Number) : void
      {
         this.§_-1U§(int(param1),this.§_-L1s§);
      }
      
      public function get maxVerticalScrollPosition() : Number
      {
         return this.§_-H1m§();
      }
      
      public function get maxHorizontalScrollPosition() : Number
      {
         return this.§_-H1§();
      }
      
      public function get verticalLineScrollSize() : Number
      {
         return this.§_-y1P§;
      }
      
      public function set verticalLineScrollSize(param1:Number) : void
      {
         this.§_-y1P§ = int(param1);
      }
      
      public function get horizontalLineScrollSize() : Number
      {
         return this.§_-61O§;
      }
      
      public function set horizontalLineScrollSize(param1:Number) : void
      {
         this.§_-61O§ = int(param1);
      }
      
      public function dispose() : void
      {
         this.§_-q1J§();
         this.§_-OB§();
         this.§_-I1u§();
         this.§_-92S§();
         removeEventListener(MouseEvent.MOUSE_WHEEL,this.§_-l2a§);
         removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-G1S§);
         removeEventListener(Event.ADDED_TO_STAGE,this.§_-1V§);
         removeEventListener(Event.REMOVED_FROM_STAGE,this.§_-72u§);
         this.§_-W1a§(this.§_-vH§,this.§_-l2P§,this.§_-r2C§,this.§_-B1J§,this.§_-v1A§);
         this.§_-W1a§(this.§_-D7§,this.§_-b1k§,this.§_-sm§,this.§_-y1F§,this.§_-93w§);
         this.§_-vH§ = this.§_-l2P§ = this.§_-r2C§ = null;
         this.§_-D7§ = this.§_-b1k§ = this.§_-sm§ = null;
         this.content = null;
      }
      
      private function §_-W1a§(param1:Sprite, param2:Sprite, param3:Sprite, param4:Function, param5:Function) : void
      {
         if(!param1)
         {
            return;
         }
         param2.removeEventListener(MouseEvent.MOUSE_DOWN,param4);
         param3.removeEventListener(MouseEvent.MOUSE_DOWN,param5);
         if(param1.parent)
         {
            param1.parent.removeChild(param1);
         }
      }
      
      private function §_-qI§() : Boolean
      {
         return this.§_-X1a§ > this.§_-oC§;
      }
      
      private function §_-b1l§() : Boolean
      {
         return this.§_-R1f§ > this.§_-B1Z§;
      }
      
      private function §_-H1§() : int
      {
         return Math.max(0,this.§_-R1f§ - this.§_-B1Z§);
      }
      
      private function §_-H1m§() : int
      {
         return Math.max(0,this.§_-X1a§ - this.§_-oC§);
      }
      
      private function §_-X10§() : int
      {
         return this.§_-oC§ - (this.§_-b1l§() ? this.§_-9j§ : 0);
      }
      
      private function §_-b2C§() : int
      {
         return this.§_-B1Z§ - (this.§_-qI§() ? this.§_-9j§ : 0);
      }
      
      private function §_-1U§(param1:int, param2:int) : void
      {
         var _loc3_:int = Math.max(0,Math.min(param1,this.§_-H1§()));
         var _loc4_:int = Math.max(0,Math.min(param2,this.§_-H1m§()));
         var _loc5_:Boolean = _loc3_ != this.§_-m1F§ || _loc4_ != this.§_-L1s§;
         this.§_-m1F§ = _loc3_;
         this.§_-L1s§ = _loc4_;
         if(this.content)
         {
            this.content.x = -_loc3_;
            this.content.y = -_loc4_;
         }
         this.§_-f2M§();
         if(_loc5_)
         {
            dispatchEvent(new Event(Event.CHANGE));
         }
      }
      
      private function §_-j2o§() : void
      {
         this.§_-vH§ = new Sprite();
         this.§_-vH§.x = this.§_-B1Z§ - this.§_-9j§;
         this.§_-l2P§ = new Sprite();
         this.§_-l2P§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-B1J§,false,0,true);
         this.§_-vH§.addChild(this.§_-l2P§);
         this.§_-r2C§ = new Sprite();
         this.§_-r2C§.buttonMode = true;
         this.§_-r2C§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-v1A§,false,0,true);
         this.§_-vH§.addChild(this.§_-r2C§);
         addChild(this.§_-vH§);
         this.§_-D7§ = new Sprite();
         this.§_-D7§.y = this.§_-oC§ - this.§_-9j§;
         this.§_-b1k§ = new Sprite();
         this.§_-b1k§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-y1F§,false,0,true);
         this.§_-D7§.addChild(this.§_-b1k§);
         this.§_-sm§ = new Sprite();
         this.§_-sm§.buttonMode = true;
         this.§_-sm§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-93w§,false,0,true);
         this.§_-D7§.addChild(this.§_-sm§);
         addChild(this.§_-D7§);
      }
      
      private function §_-lW§() : void
      {
         if(!this.§_-vH§)
         {
            return;
         }
         this.§_-vH§.mouseEnabled = this.§_-vH§.mouseChildren = this.§_-qI§();
         this.§_-l2P§.graphics.clear();
         this.§_-l2P§.graphics.beginFill(this.§_-X1Z§,this.§_-7o§);
         this.§_-l2P§.graphics.drawRect(0,0,this.§_-9j§,this.§_-X10§());
         this.§_-l2P§.graphics.endFill();
         this.§_-D7§.mouseEnabled = this.§_-D7§.mouseChildren = this.§_-b1l§();
         this.§_-b1k§.graphics.clear();
         this.§_-b1k§.graphics.beginFill(this.§_-X1Z§,this.§_-7o§);
         this.§_-b1k§.graphics.drawRect(0,0,this.§_-b2C§(),this.§_-9j§);
         this.§_-b1k§.graphics.endFill();
         this.§_-f2M§();
      }
      
      private function §_-H1R§() : void
      {
         this.§_-KT§.graphics.clear();
         this.§_-KT§.graphics.beginFill(0,0);
         this.§_-KT§.graphics.drawRect(0,0,this.§_-B1Z§,this.§_-oC§);
         this.§_-KT§.graphics.endFill();
      }
      
      private function §_-f2M§() : void
      {
         if(!this.§_-vH§)
         {
            return;
         }
         this.§_-r2C§.graphics.clear();
         if(this.§_-qI§())
         {
            this.§_-r2C§.graphics.beginFill(this.§_-oD§,this.§_-g17§);
            this.§_-r2C§.graphics.drawRoundRect(1,this.§_-C2c§(),this.§_-9j§ - 2,this.§_-I1T§(),§_-r2c§);
            this.§_-r2C§.graphics.endFill();
         }
         this.§_-sm§.graphics.clear();
         if(this.§_-b1l§())
         {
            this.§_-sm§.graphics.beginFill(this.§_-oD§,this.§_-g17§);
            this.§_-sm§.graphics.drawRoundRect(this.§_-Mx§(),1,this.§_-z1h§(),this.§_-9j§ - 2,§_-r2c§);
            this.§_-sm§.graphics.endFill();
         }
      }
      
      private function §_-I1T§() : int
      {
         return Math.max(§_-48§,int(this.§_-X10§() * this.§_-oC§ / this.§_-X1a§));
      }
      
      private function §_-C2c§() : int
      {
         if(this.§_-H1m§() == 0)
         {
            return 0;
         }
         return int(this.§_-L1s§ / this.§_-H1m§() * (this.§_-X10§() - this.§_-I1T§()));
      }
      
      private function §_-z1h§() : int
      {
         return Math.max(§_-48§,int(this.§_-b2C§() * this.§_-B1Z§ / this.§_-R1f§));
      }
      
      private function §_-Mx§() : int
      {
         if(this.§_-H1§() == 0)
         {
            return 0;
         }
         return int(this.§_-m1F§ / this.§_-H1§() * (this.§_-b2C§() - this.§_-z1h§()));
      }
      
      private function §_-NE§(param1:DisplayObject) : Boolean
      {
         if(!param1 || !this.§_-vH§)
         {
            return false;
         }
         return param1 == this.§_-vH§ || this.§_-vH§.contains(param1) || param1 == this.§_-D7§ || this.§_-D7§.contains(param1);
      }
      
      private function §_-l23§() : void
      {
         if(!this.§_-vH§)
         {
            return;
         }
         var _loc1_:Boolean = this.§_-T2q§ || this.§_-J1H§ || this.§_-B32§ || this.§_-bU§;
         this.§_-vH§.visible = this.§_-qI§() && _loc1_;
         this.§_-D7§.visible = this.§_-b1l§() && _loc1_;
      }
      
      private function §_-l2a§(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(this.§_-Q1O§(param1.stageX,param1.stageY))
         {
            return;
         }
         if(!this.§_-qI§() && !this.§_-b1l§())
         {
            return;
         }
         param1.preventDefault();
         param1.stopPropagation();
         if(param1.shiftKey || !this.§_-qI§() && this.§_-b1l§())
         {
            _loc2_ = param1.delta > 0 ? int(-this.§_-61O§) : this.§_-61O§;
            this.§_-1U§(this.§_-m1F§ + _loc2_,this.§_-L1s§);
         }
         else
         {
            _loc3_ = param1.delta > 0 ? int(-this.§_-y1P§) : this.§_-y1P§;
            this.§_-1U§(this.§_-m1F§,this.§_-L1s§ + _loc3_);
         }
      }
      
      private function §_-rN§() : void
      {
         if(!this.stage)
         {
            return;
         }
         this.stage.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-EC§,true,0,true);
         this.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.§_-PF§,true,0,true);
      }
      
      private function §_-92S§() : void
      {
         if(!this.stage)
         {
            return;
         }
         this.stage.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-EC§,true);
         this.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.§_-PF§,true);
         this.§_-r1a§();
      }
      
      private function §_-1V§(param1:Event) : void
      {
         this.§_-rN§();
         this.§_-l23§();
      }
      
      private function §_-72u§(param1:Event) : void
      {
         this.§_-q1J§();
         this.§_-OB§();
         this.§_-I1u§();
         this.§_-92S§();
         this.§_-T2q§ = false;
         this.§_-l23§();
      }
      
      private function §_-G1S§(param1:MouseEvent) : void
      {
         param1.stopPropagation();
      }
      
      private function §_-SL§(param1:DisplayObject) : Boolean
      {
         var _loc2_:TextField = null;
         while(Boolean(param1) && param1 != this)
         {
            if(param1 is TextField)
            {
               _loc2_ = param1 as TextField;
               if(_loc2_.type == TextFieldType.INPUT || _loc2_.selectable)
               {
                  return true;
               }
            }
            param1 = param1.parent;
         }
         return false;
      }
      
      private function §_-EC§(param1:MouseEvent) : void
      {
         if(this.§_-J1H§ || this.§_-B32§ || this.§_-bU§)
         {
            return;
         }
         if(!this.§_-qI§() && !this.§_-b1l§())
         {
            return;
         }
         if(this.§_-NE§(param1.target as DisplayObject))
         {
            return;
         }
         if(!this.§_-b1j§(param1.stageX,param1.stageY))
         {
            return;
         }
         if(this.§_-Q1O§(param1.stageX,param1.stageY))
         {
            return;
         }
         if(this.§_-SL§(param1.target as DisplayObject))
         {
            return;
         }
         this.§_-12f§ = param1.stageX;
         this.§_-82y§ = param1.stageY;
         this.§_-n1K§ = this.§_-m1F§;
         this.§_-32H§ = this.§_-L1s§;
         this.§_-J1H§ = true;
         this.§_-L2W§ = false;
         this.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.§_-F1K§,true,0,true);
         this.stage.addEventListener(MouseEvent.MOUSE_UP,this.§_-xr§,true,0,true);
         this.§_-l23§();
      }
      
      private function §_-PF§(param1:MouseEvent) : void
      {
         var _loc2_:Boolean = !this.§_-Q1O§(param1.stageX,param1.stageY) && (this.§_-b1j§(param1.stageX,param1.stageY) || this.§_-NE§(param1.target as DisplayObject));
         if(_loc2_ == this.§_-T2q§)
         {
            return;
         }
         this.§_-T2q§ = _loc2_;
         this.§_-l23§();
      }
      
      private function §_-b1j§(param1:Number, param2:Number) : Boolean
      {
         var _loc3_:Point = this.globalToLocal(new Point(param1,param2));
         return _loc3_.x >= 0 && _loc3_.y >= 0 && _loc3_.x < this.§_-B1Z§ && _loc3_.y < this.§_-oC§;
      }
      
      private function §_-Q1O§(param1:Number, param2:Number) : Boolean
      {
         var _loc4_:DisplayObjectContainer = null;
         var _loc5_:int = 0;
         var _loc6_:* = 0;
         var _loc7_:DisplayObject = null;
         var _loc3_:DisplayObject = this;
         while(Boolean(_loc3_) && Boolean(_loc3_.parent))
         {
            _loc4_ = _loc3_.parent;
            _loc5_ = _loc4_.getChildIndex(_loc3_);
            _loc6_ = int(_loc4_.numChildren - 1);
            while(_loc6_ > _loc5_)
            {
               _loc7_ = _loc4_.getChildAt(_loc6_);
               if(_loc7_.visible)
               {
                  if(_loc7_.hitTestPoint(param1,param2,true))
                  {
                     return true;
                  }
               }
               _loc6_--;
            }
            _loc3_ = _loc4_;
         }
         return false;
      }
      
      private function §_-F1K§(param1:MouseEvent) : void
      {
         if(!param1.buttonDown)
         {
            this.§_-q1J§();
            return;
         }
         var _loc2_:Number = param1.stageX - this.§_-12f§;
         var _loc3_:Number = param1.stageY - this.§_-82y§;
         if(Math.abs(_loc2_) > §_-J1n§ || Math.abs(_loc3_) > §_-J1n§)
         {
            this.§_-L2W§ = true;
         }
         var _loc4_:int = this.§_-b1l§() ? int(this.§_-n1K§ - _loc2_) : this.§_-m1F§;
         var _loc5_:int = this.§_-qI§() ? int(this.§_-32H§ - _loc3_) : this.§_-L1s§;
         this.§_-1U§(_loc4_,_loc5_);
      }
      
      private function §_-xr§(param1:MouseEvent) : void
      {
         var _loc2_:Boolean = this.§_-L2W§ || this.§_-m1F§ != this.§_-n1K§ || this.§_-L1s§ != this.§_-32H§;
         this.§_-q1J§();
         if(_loc2_)
         {
            param1.stopImmediatePropagation();
            param1.preventDefault();
            if(this.stage)
            {
               this.stage.addEventListener(MouseEvent.CLICK,this.§_-im§,true,0,true);
            }
         }
      }
      
      private function §_-im§(param1:MouseEvent) : void
      {
         this.§_-r1a§();
         if(this.§_-b1j§(param1.stageX,param1.stageY) && !this.§_-Q1O§(param1.stageX,param1.stageY))
         {
            param1.stopImmediatePropagation();
            param1.preventDefault();
         }
      }
      
      private function §_-r1a§() : void
      {
         if(this.stage)
         {
            this.stage.removeEventListener(MouseEvent.CLICK,this.§_-im§,true);
         }
      }
      
      private function §_-q1J§() : void
      {
         if(!this.§_-J1H§)
         {
            return;
         }
         this.§_-J1H§ = false;
         if(this.stage)
         {
            this.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.§_-F1K§,true);
            this.stage.removeEventListener(MouseEvent.MOUSE_UP,this.§_-xr§,true);
         }
         this.§_-l23§();
      }
      
      private function §_-B1J§(param1:MouseEvent) : void
      {
         param1.stopPropagation();
         if(!this.§_-qI§())
         {
            return;
         }
         var _loc2_:Number = this.§_-vH§.globalToLocal(new Point(param1.stageX,param1.stageY)).y;
         this.§_-R1z§(_loc2_ - this.§_-I1T§() * 0.5);
      }
      
      private function §_-v1A§(param1:MouseEvent) : void
      {
         param1.stopPropagation();
         if(!this.§_-qI§())
         {
            return;
         }
         var _loc2_:Stage = this.§_-vH§.stage;
         if(!_loc2_)
         {
            return;
         }
         this.§_-7X§ = this.§_-vH§.globalToLocal(new Point(param1.stageX,param1.stageY)).y - this.§_-C2c§();
         this.§_-B32§ = true;
         _loc2_.addEventListener(MouseEvent.MOUSE_MOVE,this.§_-D2Z§,true,0,true);
         _loc2_.addEventListener(MouseEvent.MOUSE_UP,this.§_-V1o§,true,0,true);
         this.§_-l23§();
      }
      
      private function §_-D2Z§(param1:MouseEvent) : void
      {
         if(!param1.buttonDown)
         {
            this.§_-OB§();
            return;
         }
         var _loc2_:Number = this.§_-vH§.globalToLocal(new Point(param1.stageX,param1.stageY)).y;
         this.§_-R1z§(_loc2_ - this.§_-7X§);
      }
      
      private function §_-V1o§(param1:MouseEvent) : void
      {
         this.§_-OB§();
      }
      
      private function §_-R1z§(param1:Number) : void
      {
         var _loc2_:int = this.§_-X10§() - this.§_-I1T§();
         if(_loc2_ <= 0)
         {
            return;
         }
         param1 = Math.max(0,Math.min(param1,_loc2_));
         this.§_-1U§(this.§_-m1F§,int(param1 / _loc2_ * this.§_-H1m§()));
      }
      
      private function §_-OB§() : void
      {
         if(!this.§_-B32§)
         {
            return;
         }
         this.§_-B32§ = false;
         if(Boolean(this.§_-vH§) && Boolean(this.§_-vH§.stage))
         {
            this.§_-vH§.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.§_-D2Z§,true);
            this.§_-vH§.stage.removeEventListener(MouseEvent.MOUSE_UP,this.§_-V1o§,true);
         }
         this.§_-l23§();
      }
      
      private function §_-y1F§(param1:MouseEvent) : void
      {
         param1.stopPropagation();
         if(!this.§_-b1l§())
         {
            return;
         }
         var _loc2_:Number = this.§_-D7§.globalToLocal(new Point(param1.stageX,param1.stageY)).x;
         this.§_-H2A§(_loc2_ - this.§_-z1h§() * 0.5);
      }
      
      private function §_-93w§(param1:MouseEvent) : void
      {
         param1.stopPropagation();
         if(!this.§_-b1l§())
         {
            return;
         }
         var _loc2_:Stage = this.§_-D7§.stage;
         if(!_loc2_)
         {
            return;
         }
         this.§_-9O§ = this.§_-D7§.globalToLocal(new Point(param1.stageX,param1.stageY)).x - this.§_-Mx§();
         this.§_-bU§ = true;
         _loc2_.addEventListener(MouseEvent.MOUSE_MOVE,this.§_-M2i§,true,0,true);
         _loc2_.addEventListener(MouseEvent.MOUSE_UP,this.§_-43m§,true,0,true);
         this.§_-l23§();
      }
      
      private function §_-M2i§(param1:MouseEvent) : void
      {
         if(!param1.buttonDown)
         {
            this.§_-I1u§();
            return;
         }
         var _loc2_:Number = this.§_-D7§.globalToLocal(new Point(param1.stageX,param1.stageY)).x;
         this.§_-H2A§(_loc2_ - this.§_-9O§);
      }
      
      private function §_-43m§(param1:MouseEvent) : void
      {
         this.§_-I1u§();
      }
      
      private function §_-H2A§(param1:Number) : void
      {
         var _loc2_:int = this.§_-b2C§() - this.§_-z1h§();
         if(_loc2_ <= 0)
         {
            return;
         }
         param1 = Math.max(0,Math.min(param1,_loc2_));
         this.§_-1U§(int(param1 / _loc2_ * this.§_-H1§()),this.§_-L1s§);
      }
      
      private function §_-I1u§() : void
      {
         if(!this.§_-bU§)
         {
            return;
         }
         this.§_-bU§ = false;
         if(Boolean(this.§_-D7§) && Boolean(this.§_-D7§.stage))
         {
            this.§_-D7§.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.§_-M2i§,true);
            this.§_-D7§.stage.removeEventListener(MouseEvent.MOUSE_UP,this.§_-43m§,true);
         }
         this.§_-l23§();
      }
   }
}

