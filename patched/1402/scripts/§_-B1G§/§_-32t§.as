package §_-B1G§
{
   import fl.data.DataProvider;
   import flash.display.CapsStyle;
   import flash.display.DisplayObjectContainer;
   import flash.display.Graphics;
   import flash.display.JointStyle;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   
   public class §_-32t§ extends Sprite
   {
      
      private static const §_-H2K§:int = 22;
      
      private static const §_-02C§:int = 1;
      
      private static const §_-02c§:int = 161;
      
      private static const §_-34§:int = 3;
      
      private static const §_-B17§:TextFormat = new TextFormat(§_-i5§.§_-c10§,12,6175017,true);
      
      private static const §_-W2P§:TextFormat = new TextFormat(§_-i5§.§_-c10§,12,6175017);
      
      private var _width:int;
      
      private var §_-o1R§:Array = [];
      
      private var §_-Of§:int = 0;
      
      private var §_-n1z§:SimpleButton;
      
      private var §_-vm§:§_-i5§;
      
      private var §_-PO§:Sprite;
      
      private var §_-Q1§:Sprite;
      
      private var §_-t2s§:Sprite;
      
      private var §_-83I§:Sprite;
      
      private var §_-N22§:Sprite;
      
      private var arrow:Sprite;
      
      private var items:Array = [];
      
      private var §_-82H§:Boolean = false;
      
      private var §_-W18§:ScrollPane;
      
      public function §_-32t§(param1:int = 160)
      {
         super();
         this._width = param1;
         this.init();
         addEventListener(Event.ADDED_TO_STAGE,this.§_-F10§);
         addEventListener(Event.REMOVED_FROM_STAGE,this.§_-D1y§);
      }
      
      public function set §_-GO§(param1:*) : void
      {
         var _loc2_:int = 0;
         if(param1 is Array)
         {
            this.§_-o1R§ = (param1 as Array).concat();
         }
         else if(param1 is DataProvider)
         {
            this.§_-o1R§ = [];
            _loc2_ = 0;
            while(_loc2_ < (param1 as DataProvider).length)
            {
               this.§_-o1R§.push((param1 as DataProvider).getItemAt(_loc2_));
               _loc2_++;
            }
         }
         else
         {
            this.§_-o1R§ = [];
         }
         this.§_-Of§ = this.§_-o1R§.length > 0 ? 0 : -1;
         this.§_-03n§();
         this.§_-B6§();
      }
      
      public function get §_-JZ§() : int
      {
         return this.§_-Of§;
      }
      
      public function set §_-JZ§(param1:int) : void
      {
         if(param1 < 0 || param1 >= this.§_-o1R§.length)
         {
            return;
         }
         this.§_-Of§ = param1;
         this.§_-B6§();
      }
      
      public function get §_-E2v§() : Object
      {
         if(this.§_-Of§ < 0 || this.§_-Of§ >= this.§_-o1R§.length)
         {
            return null;
         }
         return this.§_-o1R§[this.§_-Of§];
      }
      
      public function addItem(param1:Object) : void
      {
         this.§_-o1R§.push(param1);
         if(this.§_-Of§ < 0)
         {
            this.§_-Of§ = 0;
         }
         this.§_-03n§();
         this.§_-B6§();
      }
      
      public function removeAll() : void
      {
         this.§_-o1R§ = [];
         this.§_-Of§ = -1;
         this.§_-03n§();
         this.§_-B6§();
      }
      
      public function getItemAt(param1:int) : Object
      {
         if(param1 >= 0 && param1 < this.§_-o1R§.length)
         {
            return this.§_-o1R§[param1];
         }
         return null;
      }
      
      public function get length() : int
      {
         return this.§_-o1R§.length;
      }
      
      public function getItemIndex(param1:Object) : int
      {
         if(param1 == null)
         {
            return -1;
         }
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-o1R§.length)
         {
            if(this.§_-o1R§[_loc2_]["value"] == param1["value"])
            {
               return _loc2_;
            }
            _loc2_++;
         }
         return -1;
      }
      
      public function §_-23V§(param1:Object) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-o1R§.length)
         {
            if(this.§_-o1R§[_loc2_]["value"] == param1)
            {
               this.§_-Of§ = _loc2_;
               this.§_-B6§();
               return;
            }
            _loc2_++;
         }
      }
      
      public function get enabled() : Boolean
      {
         return this.mouseEnabled;
      }
      
      public function set enabled(param1:Boolean) : void
      {
         this.mouseEnabled = this.mouseChildren = param1;
         this.alpha = param1 ? 1 : 0.5;
      }
      
      public function dispose() : void
      {
         removeEventListener(Event.ADDED_TO_STAGE,this.§_-F10§);
         removeEventListener(Event.REMOVED_FROM_STAGE,this.§_-D1y§);
         if(this.stage)
         {
            this.stage.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-8s§);
         }
         if(this.§_-W18§)
         {
            this.§_-W18§.dispose();
            this.§_-W18§ = null;
         }
      }
      
      private function init() : void
      {
         this.§_-PO§ = this.§_-w7§(16777215,false);
         this.§_-Q1§ = this.§_-w7§(16775395,false);
         this.§_-t2s§ = this.§_-w7§(16777215,true);
         this.§_-83I§ = this.§_-w7§(16775395,true);
         this.§_-n1z§ = new SimpleButton();
         this.§_-4A§();
         this.§_-n1z§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-p2m§);
         addChild(this.§_-n1z§);
         this.§_-vm§ = new §_-i5§("",5,2,§_-B17§,this._width - 25);
         this.§_-vm§.mouseEnabled = false;
         addChild(this.§_-vm§);
         this.arrow = this.§_-42G§();
         this.arrow.x = this._width - 18;
         this.arrow.y = 9;
         addChild(this.arrow);
         this.§_-W18§ = new ScrollPane();
         this.§_-W18§.y = §_-H2K§;
         this.§_-W18§.visible = false;
         this.§_-W18§.setSize(this._width,§_-H2K§);
         this.§_-W18§.verticalLineScrollSize = §_-H2K§ + §_-02C§;
         addChild(this.§_-W18§);
         this.§_-N22§ = new Sprite();
         this.§_-W18§.source = this.§_-N22§;
      }
      
      private function §_-F10§(param1:Event) : void
      {
         this.stage.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-8s§,false,0,true);
      }
      
      private function §_-D1y§(param1:Event) : void
      {
         this.stage.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-8s§);
         if(this.§_-82H§)
         {
            this.§_-s1D§();
         }
      }
      
      private function §_-4A§() : void
      {
         if(this.§_-82H§)
         {
            this.§_-n1z§.upState = this.§_-t2s§;
            this.§_-n1z§.overState = this.§_-83I§;
            this.§_-n1z§.downState = this.§_-83I§;
            this.§_-n1z§.hitTestState = this.§_-t2s§;
         }
         else
         {
            this.§_-n1z§.upState = this.§_-PO§;
            this.§_-n1z§.overState = this.§_-Q1§;
            this.§_-n1z§.downState = this.§_-Q1§;
            this.§_-n1z§.hitTestState = this.§_-PO§;
         }
      }
      
      private function §_-w7§(param1:uint, param2:Boolean = false) : Sprite
      {
         var _loc3_:Sprite = new Sprite();
         _loc3_.graphics.beginFill(param1);
         _loc3_.graphics.lineStyle(1,14996402,1,false,"normal",CapsStyle.NONE,JointStyle.MITER,3);
         if(param2)
         {
            this.§_-7m§(_loc3_.graphics,0,0,this._width,§_-H2K§);
         }
         else
         {
            _loc3_.graphics.drawRoundRect(0,0,this._width,§_-H2K§,§_-34§ * 2,§_-34§ * 2);
         }
         _loc3_.graphics.endFill();
         return _loc3_;
      }
      
      private function §_-7m§(param1:Graphics, param2:Number, param3:Number, param4:Number, param5:Number) : void
      {
         param1.moveTo(param2 + §_-34§,param3);
         param1.lineTo(param2 + param4 - §_-34§,param3);
         param1.curveTo(param2 + param4,param3,param2 + param4,param3 + §_-34§);
         param1.lineTo(param2 + param4,param3 + param5);
         param1.lineTo(param2,param3 + param5);
         param1.lineTo(param2,param3 + §_-34§);
         param1.curveTo(param2,param3,param2 + §_-34§,param3);
      }
      
      private function §_-gp§(param1:Graphics, param2:Number, param3:Number, param4:Number, param5:Number) : void
      {
         param1.moveTo(param2,param3);
         param1.lineTo(param2 + param4,param3);
         param1.lineTo(param2 + param4,param3 + param5 - §_-34§);
         param1.curveTo(param2 + param4,param3 + param5,param2 + param4 - §_-34§,param3 + param5);
         param1.lineTo(param2 + §_-34§,param3 + param5);
         param1.curveTo(param2,param3 + param5,param2,param3 + param5 - §_-34§);
         param1.lineTo(param2,param3);
      }
      
      private function §_-42G§() : Sprite
      {
         var _loc1_:Sprite = new Sprite();
         _loc1_.graphics.beginFill(6175017);
         _loc1_.graphics.moveTo(0,0);
         _loc1_.graphics.lineTo(6,6);
         _loc1_.graphics.lineTo(12,0);
         _loc1_.graphics.endFill();
         _loc1_.mouseEnabled = false;
         return _loc1_;
      }
      
      private function §_-L2e§(param1:int) : int
      {
         return param1 * (§_-H2K§ + §_-02C§);
      }
      
      private function §_-p2b§() : int
      {
         return this.§_-o1R§.length * §_-H2K§ + Math.max(0,this.§_-o1R§.length - 1) * §_-02C§;
      }
      
      private function §_-03n§() : void
      {
         var _loc4_:Object = null;
         var _loc5_:String = null;
         var _loc6_:Sprite = null;
         while(this.§_-N22§.numChildren > 0)
         {
            this.§_-N22§.removeChildAt(0);
         }
         this.items = [];
         this.§_-W18§.graphics.clear();
         if(this.§_-o1R§.length == 0)
         {
            this.§_-W18§.setSize(this._width,§_-H2K§);
            this.§_-W18§.update();
            return;
         }
         var _loc1_:int = this.§_-p2b§();
         var _loc2_:int = Math.min(_loc1_,§_-02c§);
         this.§_-W18§.graphics.beginFill(16777215);
         this.§_-W18§.graphics.lineStyle(1,14996402,1,false,"normal",CapsStyle.NONE,JointStyle.MITER,3);
         this.§_-gp§(this.§_-W18§.graphics,0,0,this._width,_loc2_);
         this.§_-W18§.graphics.endFill();
         var _loc3_:int = 0;
         while(_loc3_ < this.§_-o1R§.length)
         {
            _loc4_ = this.§_-o1R§[_loc3_];
            _loc5_ = _loc4_["label"] !== undefined ? _loc4_["label"] : _loc4_["value"].toString();
            _loc6_ = this.§_-B25§(_loc5_,_loc3_,this._width,_loc3_ < this.§_-o1R§.length - 1);
            _loc6_.y = this.§_-L2e§(_loc3_);
            this.§_-N22§.addChild(_loc6_);
            this.items.push(_loc6_);
            _loc3_++;
         }
         this.§_-W18§.setSize(this._width,_loc2_);
         this.§_-W18§.update();
         this.§_-W18§.verticalScrollPosition = 0;
      }
      
      private function §_-B25§(param1:String, param2:int, param3:int, param4:Boolean) : Sprite
      {
         var _loc10_:Sprite = null;
         var _loc5_:Sprite = new Sprite();
         _loc5_.graphics.beginFill(16777215,0);
         _loc5_.graphics.drawRect(0,0,param3,§_-H2K§);
         _loc5_.graphics.endFill();
         var _loc6_:Sprite = new Sprite();
         _loc6_.graphics.beginFill(16775395);
         _loc6_.graphics.drawRect(0,0,param3,§_-H2K§);
         _loc6_.graphics.endFill();
         var _loc7_:SimpleButton = new SimpleButton();
         _loc7_.upState = _loc5_;
         _loc7_.overState = _loc6_;
         _loc7_.downState = _loc6_;
         _loc7_.hitTestState = _loc5_;
         var _loc8_:Sprite = new Sprite();
         _loc8_.addChild(_loc7_);
         var _loc9_:§_-i5§ = new §_-i5§(param1,5,2,§_-W2P§,param3 - 10);
         _loc9_.mouseEnabled = false;
         _loc8_.addChild(_loc9_);
         if(param4)
         {
            _loc10_ = new Sprite();
            _loc10_.graphics.lineStyle(§_-02C§,14996402,1,false,"normal",CapsStyle.NONE,JointStyle.MITER,3);
            _loc10_.graphics.moveTo(0,0);
            _loc10_.graphics.lineTo(param3,0);
            _loc10_.y = §_-H2K§;
            _loc10_.mouseEnabled = false;
            _loc8_.addChild(_loc10_);
         }
         _loc8_.name = param2.toString();
         _loc7_.addEventListener(MouseEvent.CLICK,this.§_-f18§);
         return _loc8_;
      }
      
      private function §_-p2m§(param1:MouseEvent) : void
      {
         param1.preventDefault();
         param1.stopPropagation();
         this.§_-s1D§();
      }
      
      private function §_-f18§(param1:MouseEvent) : void
      {
         param1.stopPropagation();
         var _loc2_:int = int((param1.currentTarget as SimpleButton).parent.name);
         this.§_-Of§ = _loc2_;
         this.§_-B6§();
         this.§_-s1D§();
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      private function §_-8s§(param1:MouseEvent) : void
      {
         if(!this.stage || !this.§_-82H§)
         {
            return;
         }
         if(!this.§_-W18§.hitTestPoint(param1.stageX,param1.stageY) && !hitTestPoint(param1.stageX,param1.stageY))
         {
            this.§_-s1D§();
         }
      }
      
      private function §_-r1b§() : void
      {
         var _loc1_:DisplayObjectContainer = this.parent as DisplayObjectContainer;
         if(_loc1_)
         {
            _loc1_.setChildIndex(this,_loc1_.numChildren - 1);
         }
         while(Boolean(_loc1_) && Boolean(_loc1_.parent))
         {
            _loc1_.parent.setChildIndex(_loc1_,_loc1_.parent.numChildren - 1);
            _loc1_ = _loc1_.parent as DisplayObjectContainer;
         }
      }
      
      private function §_-s1D§() : void
      {
         this.§_-82H§ = !this.§_-82H§;
         this.§_-W18§.visible = this.§_-82H§;
         this.§_-4A§();
         this.arrow.scaleY = this.§_-82H§ ? -1 : 1;
         this.arrow.y = this.§_-82H§ ? 14 : 8;
         if(!this.§_-82H§)
         {
            return;
         }
         this.§_-r1b§();
         if(this.§_-o1R§.length == 0)
         {
            return;
         }
         var _loc1_:int = this.§_-p2b§();
         var _loc2_:int = Math.min(_loc1_,§_-02c§);
         var _loc3_:int = Math.max(0,_loc1_ - _loc2_);
         var _loc4_:int = this.§_-L2e§(this.§_-Of§);
         this.§_-W18§.verticalScrollPosition = Math.min(Math.max(0,_loc4_ - _loc2_ / 2 + §_-H2K§ / 2),_loc3_);
      }
      
      private function §_-B6§() : void
      {
         var _loc1_:Object = this.§_-E2v§;
         this.§_-vm§.text = _loc1_ ? (_loc1_["label"] !== undefined ? _loc1_["label"] : _loc1_["value"].toString()) : "";
      }
   }
}

