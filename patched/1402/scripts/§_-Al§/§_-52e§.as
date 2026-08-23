package §_-Al§
{
   import §_-E1v§.§_-A3G§;
   import §_-E1v§.§_-y1B§;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.Endian;
   import protocol.§_-z1i§;
   
   public class §_-52e§ extends §_-K1K§
   {
      
      private var values:Object = {};
      
      private var §_-Y1§:§_-y1B§ = null;
      
      public function §_-52e§()
      {
         super(§_-K1K§.§_-23J§);
      }
      
      override public function load(param1:*) : void
      {
         var _loc4_:String = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         clear();
         this.values = {};
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc6_ = int(param1[_loc2_]);
            _loc7_ = int(param1[_loc2_ + 1]);
            if(_loc6_ > 0)
            {
               this.values[_loc6_] = _loc7_;
            }
            _loc2_ += 2;
         }
         var _loc3_:int = 0;
         for(_loc4_ in this.values)
         {
            if(_loc3_ >= this.§_-u1M§)
            {
               this.§_-T1t§(_loc3_ + 1);
            }
            this.§_-23Z§[_loc3_ * 2].text = _loc4_;
            this.§_-23Z§[_loc3_ * 2 + 1].text = this.values[_loc4_].toString();
            _loc3_++;
         }
         _loc5_ = _loc3_ * 2;
         while(_loc5_ < this.§_-23Z§.length)
         {
            this.§_-23Z§[_loc5_].text = "";
            _loc5_++;
         }
         this.§_-R2E§();
      }
      
      override public function save() : §_-z1i§
      {
         var _loc4_:String = null;
         var _loc5_:§_-z1i§ = null;
         var _loc6_:String = null;
         var _loc7_:String = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         this.values = {};
         var _loc1_:int = this.§_-u1M§;
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            _loc6_ = this.§_-23Z§[_loc2_ * 2].text;
            _loc7_ = this.§_-23Z§[_loc2_ * 2 + 1].text;
            _loc8_ = int(_loc6_);
            _loc9_ = int(_loc7_);
            if(_loc8_ > 0)
            {
               this.values[_loc8_] = _loc9_;
            }
            _loc2_++;
         }
         var _loc3_:int = 0;
         for(_loc4_ in this.values)
         {
            _loc3_++;
         }
         _loc5_ = new §_-z1i§();
         _loc5_.endian = Endian.LITTLE_ENDIAN;
         _loc5_.§_-C1W§(_loc3_);
         for(_loc4_ in this.values)
         {
            _loc5_.§_-C1W§(int(_loc4_));
            _loc5_.§_-C1W§(this.values[_loc4_]);
         }
         return _loc5_;
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
      
      override protected function get fieldWidth() : int
      {
         return 70;
      }
      
      private function get §_-u1M§() : int
      {
         return this.§_-23Z§.length * 0.5;
      }
      
      private function §_-T1t§(param1:int) : void
      {
         while(this.§_-u1M§ < param1)
         {
            this.§_-t1o§ = 0;
            §_-HE§("ID",this.fieldWidth);
            §_-HE§("Кол-во",this.fieldWidth);
            this.§_-J1E§ += 25;
         }
         this.§_-R2E§();
         dispatchEvent(new Event("change"));
      }
      
      private function §_-V6§() : void
      {
         if(this.§_-Y1§ != null)
         {
            return;
         }
         this.§_-Y1§ = new §_-y1B§("<body><a href=\'event:#\'>Добавить награду</a></body>",0,0,§_-A3G§.style);
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

