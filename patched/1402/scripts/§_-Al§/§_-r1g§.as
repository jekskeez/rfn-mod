package §_-Al§
{
   import §_-E1v§.§_-A3G§;
   import §_-E1v§.§_-w1k§;
   import §_-E1v§.§_-y1B§;
   import §_-U19§.§_-su§;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.Endian;
   import protocol.§_-z1i§;
   
   public class §_-r1g§ extends §_-K1K§
   {
      
      private static const §_-D1q§:int = 4;
      
      private var §_-Y1§:§_-y1B§ = null;
      
      public function §_-r1g§()
      {
         super(§_-w1k§.§_-t1d§);
      }
      
      override public function get isClan() : Boolean
      {
         return true;
      }
      
      override public function load(param1:*) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         clear();
         var _loc2_:Array = param1 is Array ? param1 as Array : (param1 != null ? param1.slots as Array : null);
         if(_loc2_ == null)
         {
            _loc2_ = [];
         }
         var _loc3_:int = _loc2_.length / 3;
         this.§_-T1t§(_loc3_ == 0 ? 1 : _loc3_);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = int(_loc2_[_loc4_ * 3]);
            _loc6_ = int(_loc2_[_loc4_ * 3 + 2]);
            this.§_-23Z§[_loc4_ * §_-D1q§].text = String(_loc5_);
            this.§_-23Z§[_loc4_ * §_-D1q§ + 1].text = String(_loc2_[_loc4_ * 3 + 1]);
            this.§_-23Z§[_loc4_ * §_-D1q§ + 2].text = String(_loc6_);
            this.§_-23Z§[_loc4_ * §_-D1q§ + 3].text = this.§_-Jv§(_loc6_);
            _loc4_++;
         }
         this.§_-R2E§();
      }
      
      override public function save() : §_-z1i§
      {
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-u1M§)
         {
            _loc4_ = this.§_-23Z§[_loc2_ * §_-D1q§].text;
            _loc5_ = this.§_-23Z§[_loc2_ * §_-D1q§ + 1].text;
            _loc6_ = this.§_-23Z§[_loc2_ * §_-D1q§ + 2].text;
            if(!(_loc4_ == "" || _loc6_ == ""))
            {
               _loc1_.push([int(_loc4_),int(_loc5_),int(_loc6_)]);
            }
            _loc2_++;
         }
         var _loc3_:§_-z1i§ = new §_-z1i§();
         _loc3_.endian = Endian.LITTLE_ENDIAN;
         _loc3_.§_-C1W§(_loc1_.length);
         _loc2_ = 0;
         while(_loc2_ < _loc1_.length)
         {
            _loc3_.writeByte(_loc1_[_loc2_][0]);
            _loc3_.§_-C1W§(_loc1_[_loc2_][1]);
            _loc3_.writeByte(_loc1_[_loc2_][2]);
            _loc2_++;
         }
         return _loc3_;
      }
      
      override protected function init() : void
      {
         super.init();
         this.§_-V6§();
      }
      
      override protected function §_-c1v§() : void
      {
      }
      
      override protected function get fieldList() : Array
      {
         return [];
      }
      
      override protected function §_-w1T§(param1:Event) : void
      {
         super.§_-w1T§(param1);
         this.§_-Q2O§();
      }
      
      private function get §_-u1M§() : int
      {
         return this.§_-23Z§.length / §_-D1q§;
      }
      
      private function §_-T1t§(param1:int) : void
      {
         while(this.§_-u1M§ < param1)
         {
            this.§_-t1o§ = 0;
            §_-HE§("Слот",30);
            §_-HE§("Истекает",100);
            §_-HE§("Тотем",30);
            §_-HE§("Имя",120,false);
            this.§_-J1E§ += 25;
         }
         this.§_-R2E§();
         dispatchEvent(new Event("change"));
      }
      
      private function §_-Q2O§() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.§_-u1M§)
         {
            this.§_-23Z§[_loc1_ * §_-D1q§ + 3].text = this.§_-Jv§(int(this.§_-23Z§[_loc1_ * §_-D1q§ + 2].text));
            _loc1_++;
         }
      }
      
      private function §_-Jv§(param1:int) : String
      {
         var _loc2_:String = §_-su§.getName(param1);
         return _loc2_ != null ? _loc2_ : (param1 == §_-su§.NONE ? "Пусто" : "Тотем " + param1);
      }
      
      private function §_-V6§() : void
      {
         if(this.§_-Y1§ != null)
         {
            return;
         }
         this.§_-Y1§ = new §_-y1B§("<body><a href=\'event:#\'>Добавить слот</a></body>",0,0,§_-A3G§.style);
         this.§_-Y1§.addEventListener(MouseEvent.CLICK,this.§_-z1A§);
         this.§_-R2E§();
      }
      
      private function §_-R2E§() : void
      {
         if(!this.§_-Y1§)
         {
            return;
         }
         this.§_-Y1§.x = 0;
         this.§_-Y1§.y = this.§_-u1M§ == 0 ? 0 : this.§_-2H§.height;
         addChild(this.§_-Y1§);
      }
      
      private function §_-z1A§(param1:MouseEvent) : void
      {
         this.§_-T1t§(this.§_-u1M§ + 1);
      }
   }
}

