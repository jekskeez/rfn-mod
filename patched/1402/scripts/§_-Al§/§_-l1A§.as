package §_-Al§
{
   import §_-E1v§.§_-A3G§;
   import §_-E1v§.§_-j1d§;
   import §_-E1v§.§_-y1B§;
   import fl.controls.CheckBox;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class §_-l1A§
   {
      
      private static const §_-7E§:int = 460;
      
      private static const §_-Wc§:int = 8;
      
      private static const §_-a1G§:int = 25;
      
      public var sprite:Sprite = new Sprite();
      
      private var §_-i1h§:int = 78;
      
      private var §_-r0§:TextField = null;
      
      private var §_-HB§:TextField = null;
      
      private var §_-D2w§:TextField = null;
      
      private var §_-83z§:TextField = null;
      
      private var §_-h2k§:TextField = null;
      
      private var §_-h1Y§:TextField = null;
      
      private var §_-W2Z§:CheckBox = null;
      
      private var §_-a1g§:Vector.<§_-73A§> = new Vector.<§_-73A§>();
      
      private var §_-K2O§:§_-y1B§ = null;
      
      private var §_-z2X§:Function = null;
      
      private var §_-Z1l§:Function = null;
      
      public function §_-l1A§(param1:Function, param2:Function)
      {
         super();
         this.§_-z2X§ = param1;
         this.§_-Z1l§ = param2;
         this.§_-A3M§();
         this.§_-r2e§();
      }
      
      public function §_-G2d§() : int
      {
         return int(this.§_-r0§.text);
      }
      
      public function load(param1:Array) : void
      {
         this.§_-k2C§();
         if(param1 == null)
         {
            this.§_-m1E§(1);
            return;
         }
         this.§_-r0§.text = param1[0];
         this.§_-HB§.text = param1[1];
         this.§_-D2w§.text = param1[2];
         this.§_-83z§.text = param1[3];
         this.§_-W2Z§.selected = param1[4];
         this.§_-h2k§.text = param1[5];
         this.§_-h1Y§.text = param1[6];
         this.§_-Zr§(param1[7]);
      }
      
      private function §_-Zr§(param1:Array) : void
      {
         var _loc4_:int = 0;
         var _loc5_:Array = null;
         if(param1 == null || param1.length == 0)
         {
            this.§_-m1E§(1);
            return;
         }
         if(param1[0] is Array)
         {
            this.§_-m1E§(param1.length);
            _loc4_ = 0;
            while(_loc4_ < param1.length)
            {
               _loc5_ = param1[_loc4_] as Array;
               this.§_-a1g§[_loc4_].load(int(_loc5_[0]),int(_loc5_[1]),int(_loc5_[2]) != 0);
               _loc4_++;
            }
            return;
         }
         var _loc2_:int = int(param1.length / 3);
         this.§_-m1E§(_loc2_ == 0 ? 1 : _loc2_);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.§_-a1g§[_loc3_].load(int(param1[_loc3_ * 3]),int(param1[_loc3_ * 3 + 1]),int(param1[_loc3_ * 3 + 2]) != 0);
            _loc3_++;
         }
      }
      
      public function §_-26§() : Array
      {
         var _loc2_:§_-73A§ = null;
         var _loc3_:Array = null;
         if(this.§_-r0§.text == "")
         {
            return null;
         }
         var _loc1_:Array = [];
         for each(_loc2_ in this.§_-a1g§)
         {
            _loc3_ = _loc2_.§_-x2R§();
            if(_loc3_ != null)
            {
               _loc1_.push(_loc3_);
            }
         }
         return [int(this.§_-r0§.text),int(this.§_-HB§.text),int(this.§_-D2w§.text),int(this.§_-83z§.text),this.§_-W2Z§.selected ? 1 : 0,int(this.§_-h2k§.text),int(this.§_-h1Y§.text),_loc1_];
      }
      
      public function §_-fc§() : int
      {
         if(this.§_-a1g§.length == 0)
         {
            return this.§_-i1h§ + 30;
         }
         var _loc1_:§_-73A§ = this.§_-a1g§[this.§_-a1g§.length - 1];
         return int(_loc1_.sprite.y) + 52;
      }
      
      public function dispose() : void
      {
         this.§_-k2C§();
         if(Boolean(this.§_-K2O§) && Boolean(this.§_-K2O§.parent))
         {
            this.§_-K2O§.parent.removeChild(this.§_-K2O§);
         }
         if(this.sprite.parent)
         {
            this.sprite.parent.removeChild(this.sprite);
         }
         this.§_-11S§();
      }
      
      private function §_-A3M§() : void
      {
         var _loc1_:§_-y1B§ = new §_-y1B§("<body><b>Пропуск</b></body>",0,0,§_-A3G§.style);
         this.sprite.addChild(_loc1_);
         var _loc2_:int = 0;
         var _loc3_:int = 22;
         this.§_-r0§ = this.§_-lY§("Версия",45,_loc2_,_loc3_);
         _loc2_ = int(this.§_-r0§.parent.x + this.§_-r0§.parent.width + §_-Wc§);
         _loc3_ = int(this.§_-r0§.parent.y);
         this.§_-HB§ = this.§_-lY§("Старт",85,_loc2_,_loc3_);
         _loc2_ = int(this.§_-HB§.parent.x + this.§_-HB§.parent.width + §_-Wc§);
         _loc3_ = int(this.§_-HB§.parent.y);
         this.§_-D2w§ = this.§_-lY§("Уровень",35,_loc2_,_loc3_);
         _loc2_ = int(this.§_-D2w§.parent.x + this.§_-D2w§.parent.width + §_-Wc§);
         _loc3_ = int(this.§_-D2w§.parent.y);
         this.§_-83z§ = this.§_-lY§("Очки",50,_loc2_,_loc3_);
         _loc2_ = int(this.§_-83z§.parent.x + this.§_-83z§.parent.width + §_-Wc§);
         _loc3_ = int(this.§_-83z§.parent.y);
         this.§_-h2k§ = this.§_-lY§("Даритель",55,_loc2_,_loc3_);
         _loc2_ = int(this.§_-h2k§.parent.x + this.§_-h2k§.parent.width + §_-Wc§);
         _loc3_ = int(this.§_-h2k§.parent.y);
         this.§_-h1Y§ = this.§_-lY§("Скипы",40,_loc2_,_loc3_);
         _loc2_ = int(this.§_-h1Y§.parent.x + this.§_-h1Y§.parent.width + §_-Wc§);
         _loc3_ = int(this.§_-h1Y§.parent.y);
         this.§_-W2Z§ = new CheckBox();
         this.§_-W2Z§.label = "Куплен";
         this.§_-W2Z§.addEventListener(Event.CHANGE,this.§_-z2A§);
         if(_loc2_ > 0 && _loc2_ + 75 > §_-7E§)
         {
            _loc2_ = 0;
            _loc3_ += §_-a1G§;
         }
         this.§_-W2Z§.x = _loc2_;
         this.§_-W2Z§.y = _loc3_ + 2;
         this.sprite.addChild(this.§_-W2Z§);
         this.§_-i1h§ = _loc3_ + §_-a1G§ + 4;
         var _loc4_:§_-y1B§ = new §_-y1B§("Задания:",0,this.§_-i1h§,§_-A3G§.§_-EF§);
         this.sprite.addChild(_loc4_);
         this.§_-i1h§ += 20;
      }
      
      private function §_-lY§(param1:String, param2:int, param3:int, param4:int) : TextField
      {
         var _loc5_:Sprite = new Sprite();
         _loc5_.addChild(new §_-y1B§(param1,0,0,§_-A3G§.§_-v1I§));
         var _loc6_:TextField = new TextField();
         _loc6_.selectable = true;
         _loc6_.mouseEnabled = true;
         _loc6_.addEventListener(Event.CHANGE,this.§_-z2A§);
         §_-j1d§.§_-43I§(_loc6_,_loc5_,int(_loc5_.width) + 2,0,param2,18,100,true);
         if(param3 > 0 && param3 + _loc5_.width > §_-7E§)
         {
            param3 = 0;
            param4 += §_-a1G§;
         }
         _loc5_.x = param3;
         _loc5_.y = param4;
         this.sprite.addChild(_loc5_);
         return _loc6_;
      }
      
      private function §_-r2e§() : void
      {
         this.§_-K2O§ = new §_-y1B§("<body><a href=\'event:#\'>Добавить задание</a></body>",10,0,§_-A3G§.style);
         this.§_-K2O§.addEventListener(MouseEvent.CLICK,this.§_-02N§);
      }
      
      private function §_-m1E§(param1:int) : void
      {
         while(this.§_-a1g§.length < param1)
         {
            this.§_-k1Q§();
         }
         this.§_-U1k§();
      }
      
      private function §_-k1Q§() : void
      {
         var _loc1_:§_-73A§ = new §_-73A§(this.§_-vR§,this.§_-G2d§);
         this.§_-a1g§.push(_loc1_);
         this.sprite.addChild(_loc1_.sprite);
         this.§_-U1k§();
      }
      
      private function §_-k2C§() : void
      {
         var _loc1_:§_-73A§ = null;
         for each(_loc1_ in this.§_-a1g§)
         {
            _loc1_.dispose();
         }
         this.§_-a1g§ = new Vector.<§_-73A§>();
      }
      
      private function §_-U1k§() : void
      {
         var _loc1_:int = this.§_-i1h§;
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-a1g§.length)
         {
            this.§_-a1g§[_loc2_].sprite.x = 10;
            this.§_-a1g§[_loc2_].sprite.y = _loc1_;
            _loc1_ += 48;
            _loc2_++;
         }
         if(this.§_-K2O§)
         {
            this.§_-K2O§.x = 10;
            this.§_-K2O§.y = _loc1_;
            if(this.§_-K2O§.parent != this.sprite)
            {
               this.sprite.addChild(this.§_-K2O§);
            }
         }
         if(this.§_-Z1l§ != null)
         {
            this.§_-Z1l§();
         }
      }
      
      private function §_-02N§(param1:MouseEvent) : void
      {
         this.§_-k1Q§();
         this.§_-vR§();
      }
      
      private function §_-vR§() : void
      {
         var _loc1_:§_-73A§ = null;
         for each(_loc1_ in this.§_-a1g§)
         {
            _loc1_.§_-G1f§();
         }
         if(this.§_-z2X§ != null)
         {
            this.§_-z2X§();
         }
      }
      
      private function §_-z2A§(param1:Event) : void
      {
         this.§_-vR§();
      }
      
      private function §_-11S§() : void
      {
         if(this.§_-r0§)
         {
            this.§_-r0§.removeEventListener(Event.CHANGE,this.§_-z2A§);
         }
         if(this.§_-HB§)
         {
            this.§_-HB§.removeEventListener(Event.CHANGE,this.§_-z2A§);
         }
         if(this.§_-D2w§)
         {
            this.§_-D2w§.removeEventListener(Event.CHANGE,this.§_-z2A§);
         }
         if(this.§_-83z§)
         {
            this.§_-83z§.removeEventListener(Event.CHANGE,this.§_-z2A§);
         }
         if(this.§_-h2k§)
         {
            this.§_-h2k§.removeEventListener(Event.CHANGE,this.§_-z2A§);
         }
         if(this.§_-h1Y§)
         {
            this.§_-h1Y§.removeEventListener(Event.CHANGE,this.§_-z2A§);
         }
         if(this.§_-W2Z§)
         {
            this.§_-W2Z§.removeEventListener(Event.CHANGE,this.§_-z2A§);
         }
      }
   }
}

