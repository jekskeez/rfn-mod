package §_-p1f§
{
   import §_-l26§.§_-32A§;
   import §_-l26§.§_-43M§;
   import §_-l26§.§_-i1J§;
   import fl.controls.CheckBox;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class §_-AJ§
   {
      
      private static const §_-CN§:int = 460;
      
      private static const §_-uW§:int = 8;
      
      private static const §_-Uh§:int = 25;
      
      public var sprite:Sprite = new Sprite();
      
      private var §_-i1f§:int = 78;
      
      private var §_-A39§:TextField = null;
      
      private var §_-y1C§:TextField = null;
      
      private var §_-Qr§:TextField = null;
      
      private var §_-yx§:TextField = null;
      
      private var §_-Sj§:TextField = null;
      
      private var §_-kD§:TextField = null;
      
      private var §_-E2v§:CheckBox = null;
      
      private var §_-t2v§:Vector.<§_-Q2j§> = new Vector.<§_-Q2j§>();
      
      private var §_-mK§:§_-i1J§ = null;
      
      private var §_-43b§:Function = null;
      
      private var §_-R1k§:Function = null;
      
      public function §_-AJ§(param1:Function, param2:Function)
      {
         super();
         this.§_-43b§ = param1;
         this.§_-R1k§ = param2;
         this.§_-Y1N§();
         this.§_-HK§();
      }
      
      public function §_-h1T§() : int
      {
         return int(this.§_-A39§.text);
      }
      
      public function load(param1:Array) : void
      {
         this.§_-U1h§();
         if(param1 == null)
         {
            this.§_-M1B§(1);
            return;
         }
         this.§_-A39§.text = param1[0];
         this.§_-y1C§.text = param1[1];
         this.§_-Qr§.text = param1[2];
         this.§_-yx§.text = param1[3];
         this.§_-E2v§.selected = param1[4];
         this.§_-Sj§.text = param1[5];
         this.§_-kD§.text = param1[6];
         this.§_-1e§(param1[7]);
      }
      
      private function §_-1e§(param1:Array) : void
      {
         var _loc4_:int = 0;
         var _loc5_:Array = null;
         if(param1 == null || param1.length == 0)
         {
            this.§_-M1B§(1);
            return;
         }
         if(param1[0] is Array)
         {
            this.§_-M1B§(param1.length);
            _loc4_ = 0;
            while(_loc4_ < param1.length)
            {
               _loc5_ = param1[_loc4_] as Array;
               this.§_-t2v§[_loc4_].load(int(_loc5_[0]),int(_loc5_[1]),int(_loc5_[2]) != 0);
               _loc4_++;
            }
            return;
         }
         var _loc2_:int = int(param1.length / 3);
         this.§_-M1B§(_loc2_ == 0 ? 1 : _loc2_);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.§_-t2v§[_loc3_].load(int(param1[_loc3_ * 3]),int(param1[_loc3_ * 3 + 1]),int(param1[_loc3_ * 3 + 2]) != 0);
            _loc3_++;
         }
      }
      
      public function §_-b1t§() : Array
      {
         var _loc2_:§_-Q2j§ = null;
         var _loc3_:Array = null;
         if(this.§_-A39§.text == "")
         {
            return null;
         }
         var _loc1_:Array = [];
         for each(_loc2_ in this.§_-t2v§)
         {
            _loc3_ = _loc2_.§_-k2K§();
            if(_loc3_ != null)
            {
               _loc1_.push(_loc3_);
            }
         }
         return [int(this.§_-A39§.text),int(this.§_-y1C§.text),int(this.§_-Qr§.text),int(this.§_-yx§.text),this.§_-E2v§.selected ? 1 : 0,int(this.§_-Sj§.text),int(this.§_-kD§.text),_loc1_];
      }
      
      public function §_-u22§() : int
      {
         if(this.§_-t2v§.length == 0)
         {
            return this.§_-i1f§ + 30;
         }
         var _loc1_:§_-Q2j§ = this.§_-t2v§[this.§_-t2v§.length - 1];
         return int(_loc1_.sprite.y) + 52;
      }
      
      public function dispose() : void
      {
         this.§_-U1h§();
         if(Boolean(this.§_-mK§) && Boolean(this.§_-mK§.parent))
         {
            this.§_-mK§.parent.removeChild(this.§_-mK§);
         }
         if(this.sprite.parent)
         {
            this.sprite.parent.removeChild(this.sprite);
         }
         this.§_-6v§();
      }
      
      private function §_-Y1N§() : void
      {
         var _loc1_:§_-i1J§ = new §_-i1J§("<body><b>Пропуск</b></body>",0,0,§_-32A§.style);
         this.sprite.addChild(_loc1_);
         var _loc2_:int = 0;
         var _loc3_:int = 22;
         this.§_-A39§ = this.§_-p2X§("Версия",45,_loc2_,_loc3_);
         _loc2_ = int(this.§_-A39§.parent.x + this.§_-A39§.parent.width + §_-uW§);
         _loc3_ = int(this.§_-A39§.parent.y);
         this.§_-y1C§ = this.§_-p2X§("Старт",85,_loc2_,_loc3_);
         _loc2_ = int(this.§_-y1C§.parent.x + this.§_-y1C§.parent.width + §_-uW§);
         _loc3_ = int(this.§_-y1C§.parent.y);
         this.§_-Qr§ = this.§_-p2X§("Уровень",35,_loc2_,_loc3_);
         _loc2_ = int(this.§_-Qr§.parent.x + this.§_-Qr§.parent.width + §_-uW§);
         _loc3_ = int(this.§_-Qr§.parent.y);
         this.§_-yx§ = this.§_-p2X§("Очки",50,_loc2_,_loc3_);
         _loc2_ = int(this.§_-yx§.parent.x + this.§_-yx§.parent.width + §_-uW§);
         _loc3_ = int(this.§_-yx§.parent.y);
         this.§_-Sj§ = this.§_-p2X§("Даритель",55,_loc2_,_loc3_);
         _loc2_ = int(this.§_-Sj§.parent.x + this.§_-Sj§.parent.width + §_-uW§);
         _loc3_ = int(this.§_-Sj§.parent.y);
         this.§_-kD§ = this.§_-p2X§("Скипы",40,_loc2_,_loc3_);
         _loc2_ = int(this.§_-kD§.parent.x + this.§_-kD§.parent.width + §_-uW§);
         _loc3_ = int(this.§_-kD§.parent.y);
         this.§_-E2v§ = new CheckBox();
         this.§_-E2v§.label = "Куплен";
         this.§_-E2v§.addEventListener(Event.CHANGE,this.§_-R2W§);
         if(_loc2_ > 0 && _loc2_ + 75 > §_-CN§)
         {
            _loc2_ = 0;
            _loc3_ += §_-Uh§;
         }
         this.§_-E2v§.x = _loc2_;
         this.§_-E2v§.y = _loc3_ + 2;
         this.sprite.addChild(this.§_-E2v§);
         this.§_-i1f§ = _loc3_ + §_-Uh§ + 4;
         var _loc4_:§_-i1J§ = new §_-i1J§("Задания:",0,this.§_-i1f§,§_-32A§.§_-hP§);
         this.sprite.addChild(_loc4_);
         this.§_-i1f§ += 20;
      }
      
      private function §_-p2X§(param1:String, param2:int, param3:int, param4:int) : TextField
      {
         var _loc5_:Sprite = new Sprite();
         _loc5_.addChild(new §_-i1J§(param1,0,0,§_-32A§.§_-53t§));
         var _loc6_:TextField = new TextField();
         _loc6_.selectable = true;
         _loc6_.mouseEnabled = true;
         _loc6_.addEventListener(Event.CHANGE,this.§_-R2W§);
         §_-43M§.§_-22h§(_loc6_,_loc5_,int(_loc5_.width) + 2,0,param2,18,100,true);
         if(param3 > 0 && param3 + _loc5_.width > §_-CN§)
         {
            param3 = 0;
            param4 += §_-Uh§;
         }
         _loc5_.x = param3;
         _loc5_.y = param4;
         this.sprite.addChild(_loc5_);
         return _loc6_;
      }
      
      private function §_-HK§() : void
      {
         this.§_-mK§ = new §_-i1J§("<body><a href=\'event:#\'>Добавить задание</a></body>",10,0,§_-32A§.style);
         this.§_-mK§.addEventListener(MouseEvent.CLICK,this.§_-02R§);
      }
      
      private function §_-M1B§(param1:int) : void
      {
         while(this.§_-t2v§.length < param1)
         {
            this.§_-Et§();
         }
         this.§_-p1V§();
      }
      
      private function §_-Et§() : void
      {
         var _loc1_:§_-Q2j§ = new §_-Q2j§(this.§_-Dp§,this.§_-h1T§);
         this.§_-t2v§.push(_loc1_);
         this.sprite.addChild(_loc1_.sprite);
         this.§_-p1V§();
      }
      
      private function §_-U1h§() : void
      {
         var _loc1_:§_-Q2j§ = null;
         for each(_loc1_ in this.§_-t2v§)
         {
            _loc1_.dispose();
         }
         this.§_-t2v§ = new Vector.<§_-Q2j§>();
      }
      
      private function §_-p1V§() : void
      {
         var _loc1_:int = this.§_-i1f§;
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-t2v§.length)
         {
            this.§_-t2v§[_loc2_].sprite.x = 10;
            this.§_-t2v§[_loc2_].sprite.y = _loc1_;
            _loc1_ += 48;
            _loc2_++;
         }
         if(this.§_-mK§)
         {
            this.§_-mK§.x = 10;
            this.§_-mK§.y = _loc1_;
            if(this.§_-mK§.parent != this.sprite)
            {
               this.sprite.addChild(this.§_-mK§);
            }
         }
         if(this.§_-R1k§ != null)
         {
            this.§_-R1k§();
         }
      }
      
      private function §_-02R§(param1:MouseEvent) : void
      {
         this.§_-Et§();
         this.§_-Dp§();
      }
      
      private function §_-Dp§() : void
      {
         var _loc1_:§_-Q2j§ = null;
         for each(_loc1_ in this.§_-t2v§)
         {
            _loc1_.§_-93F§();
         }
         if(this.§_-43b§ != null)
         {
            this.§_-43b§();
         }
      }
      
      private function §_-R2W§(param1:Event) : void
      {
         this.§_-Dp§();
      }
      
      private function §_-6v§() : void
      {
         if(this.§_-A39§)
         {
            this.§_-A39§.removeEventListener(Event.CHANGE,this.§_-R2W§);
         }
         if(this.§_-y1C§)
         {
            this.§_-y1C§.removeEventListener(Event.CHANGE,this.§_-R2W§);
         }
         if(this.§_-Qr§)
         {
            this.§_-Qr§.removeEventListener(Event.CHANGE,this.§_-R2W§);
         }
         if(this.§_-yx§)
         {
            this.§_-yx§.removeEventListener(Event.CHANGE,this.§_-R2W§);
         }
         if(this.§_-Sj§)
         {
            this.§_-Sj§.removeEventListener(Event.CHANGE,this.§_-R2W§);
         }
         if(this.§_-kD§)
         {
            this.§_-kD§.removeEventListener(Event.CHANGE,this.§_-R2W§);
         }
         if(this.§_-E2v§)
         {
            this.§_-E2v§.removeEventListener(Event.CHANGE,this.§_-R2W§);
         }
      }
   }
}

