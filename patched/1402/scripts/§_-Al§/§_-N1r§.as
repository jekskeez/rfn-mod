package §_-Al§
{
   import §_-X1k§.§_-P2x§;
   import flash.events.KeyboardEvent;
   import flash.ui.Keyboard;
   import flash.utils.Endian;
   import flash.utils.getTimer;
   import protocol.§_-z1i§;
   import utils.§_-B1d§;
   
   public class §_-N1r§ extends §_-K1K§
   {
      
      private var values:Object = {};
      
      public function §_-N1r§()
      {
         super(§_-K1K§.§_-jN§);
      }
      
      override public function load(param1:*) : void
      {
         var _loc3_:int = 0;
         this.values = {};
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            this.values[param1[_loc2_]] = {
               "level":param1[_loc2_ + 1],
               "time":param1[_loc2_ + 2],
               "worn":param1[_loc2_ + 3],
               "slot":param1[_loc2_ + 4],
               "reason":param1[_loc2_ + 5]
            };
            _loc2_ += 6;
         }
         _loc2_ = 0;
         while(_loc2_ < §_-P2x§.§_-LN§ - 7)
         {
            this.§_-53W§[_loc2_ * 2].selected = _loc2_ in this.values;
            this.§_-53W§[_loc2_ * 2 + 1].selected = _loc2_ in this.values && this.values[_loc2_]["worn"] != 0;
            this.§_-23Z§[_loc2_ * 5].text = _loc2_ in this.values ? this.values[_loc2_]["level"] : "0";
            this.§_-23Z§[_loc2_ * 5 + 1].text = _loc2_ in this.values ? this.values[_loc2_]["reason"] : "0";
            this.§_-23Z§[_loc2_ * 5 + 2].text = _loc2_ in this.values ? this.values[_loc2_]["slot"] : "0";
            if(this.§_-23Z§[_loc2_ * 5 + 3] != null)
            {
               _loc3_ = _loc2_ in this.values ? int(this.values[_loc2_]["time"]) : 0;
               if(_loc3_ > 0)
               {
                  _loc3_ -= Game.§_-i24§ + int(getTimer() / 1000);
               }
               this.§_-23Z§[_loc2_ * 5 + 3].text = _loc3_.toString();
               this.§_-23Z§[_loc2_ * 5 + 4].text = §_-B1d§.§_-g2n§(_loc3_);
            }
            _loc2_++;
         }
      }
      
      override public function save() : §_-z1i§
      {
         var _loc3_:String = null;
         var _loc4_:§_-z1i§ = null;
         this.values = {};
         var _loc1_:int = 0;
         while(_loc1_ < §_-P2x§.§_-LN§ - 7)
         {
            if(this.§_-53W§[_loc1_ * 2].selected)
            {
               this.values[_loc1_] = {};
               this.values[_loc1_]["worn"] = this.§_-53W§[_loc1_ * 2 + 1].selected ? 1 : 0;
               this.values[_loc1_]["level"] = int(this.§_-23Z§[_loc1_ * 5].text);
               this.values[_loc1_]["reason"] = int(this.§_-23Z§[_loc1_ * 5 + 1].text);
               this.values[_loc1_]["slot"] = int(this.§_-23Z§[_loc1_ * 5 + 2].text);
               if(this.§_-23Z§[_loc1_ * 5 + 3] == null)
               {
                  this.values[_loc1_]["time"] = 0;
               }
               else
               {
                  this.values[_loc1_]["time"] = int(this.§_-23Z§[_loc1_ * 5 + 3].text);
               }
            }
            _loc1_++;
         }
         var _loc2_:int = 0;
         for(_loc3_ in this.values)
         {
            _loc2_++;
         }
         _loc4_ = new §_-z1i§();
         _loc4_.endian = Endian.LITTLE_ENDIAN;
         _loc4_.§_-C1W§(_loc2_);
         for(_loc3_ in this.values)
         {
            _loc4_.§_-C1W§(int(_loc3_));
            _loc4_.writeByte(this.values[_loc3_]["level"]);
            if(this.values[_loc3_]["time"] == 0)
            {
               _loc4_.§_-C1W§(this.values[_loc3_]["time"]);
            }
            else
            {
               _loc4_.§_-C1W§(this.values[_loc3_]["time"] + Game.§_-i24§ + int(getTimer() / 1000));
            }
            _loc4_.writeByte(this.values[_loc3_]["worn"]);
            _loc4_.§_-C1W§(this.values[_loc3_]["slot"]);
            _loc4_.writeByte(this.values[_loc3_]["reason"]);
         }
         return _loc4_;
      }
      
      override protected function §_-c1v§() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < §_-P2x§.§_-LN§ - 7)
         {
            §_-13x§(§_-P2x§.§_-01H§(_loc1_));
            §_-13x§("Надет");
            §_-HE§("Уровень",25);
            §_-HE§("Причина",25);
            §_-HE§("Слот",25,false);
            this.§_-t1o§ = 0;
            this.§_-J1E§ += 25;
            §_-HE§("Время",100);
            this.§_-23Z§[this.§_-23Z§.length - 1].name = _loc1_.toString();
            this.§_-23Z§[this.§_-23Z§.length - 1].addEventListener(KeyboardEvent.KEY_DOWN,this.§_-M29§);
            §_-HE§("Окончание ",125,false);
            _loc1_++;
         }
      }
      
      override protected function get checkTitleWidth() : int
      {
         return this.§_-53W§.length % 2 == 0 ? 125 : 0;
      }
      
      private function §_-M29§(param1:KeyboardEvent) : void
      {
         if(param1.keyCode != Keyboard.ENTER)
         {
            return;
         }
         var _loc2_:int = int(param1.currentTarget.name);
         this.§_-23Z§[_loc2_ * 5 + 4].text = §_-B1d§.§_-g2n§(int(param1.currentTarget.text));
         if(int(param1.currentTarget.text) != 0)
         {
            this.§_-53W§[_loc2_ * 2].selected = true;
         }
      }
   }
}

