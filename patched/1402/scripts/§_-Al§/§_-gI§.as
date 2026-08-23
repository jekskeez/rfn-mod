package §_-Al§
{
   import fl.data.DataProvider;
   import flash.utils.Endian;
   import protocol.§_-z1i§;
   import utils.§_-B1d§;
   import utils.§_-jb§;
   
   public class §_-gI§ extends §_-K1K§
   {
      
      public static const §_-eb§:Array = ["Нет","Кляп","Бан","Пермач"];
      
      private var reason:int = 0;
      
      private var §_-S1J§:Boolean = false;
      
      private var §_-pT§:int = 0;
      
      private var time:int = 0;
      
      public function §_-gI§()
      {
         super(§_-K1K§.§_-x1i§);
      }
      
      override protected function init() : void
      {
         super.init();
         this.§_-23Z§[1].selectable = false;
         this.§_-23Z§[1].mouseEnabled = false;
         this.§_-23Z§[2].selectable = false;
         this.§_-23Z§[2].mouseEnabled = false;
      }
      
      override public function load(param1:*) : void
      {
         var _loc2_:int = int(param1[0]);
         this.§_-S1J§ = false;
         this.reason = int(param1[1]);
         this.§_-pT§ = int(param1[2]);
         this.time = int(param1[3]);
         this.§_-23Z§[0].text = this.§_-pT§.toString();
         this.§_-23Z§[1].text = §_-B1d§.§_-g2n§(this.time);
         this.§_-23Z§[2].text = §_-eb§[_loc2_];
         this.§_-53W§[0].selected = this.§_-S1J§;
         this.§_-01i§[0].§_-JZ§ = this.reason;
      }
      
      override public function save() : §_-z1i§
      {
         this.§_-S1J§ = this.§_-53W§[0].selected;
         this.reason = int(this.§_-01i§[0].§_-E2v§["value"]);
         this.§_-pT§ = int(this.§_-23Z§[0].text);
         var _loc1_:§_-z1i§ = new §_-z1i§();
         _loc1_.endian = Endian.LITTLE_ENDIAN;
         _loc1_.writeByte(this.reason);
         _loc1_.writeByte(this.§_-S1J§ ? 1 : 0);
         if(this.§_-23Z§[0].text.length > 0)
         {
            _loc1_.§_-C1W§(this.§_-pT§);
         }
         return _loc1_;
      }
      
      override protected function get fieldList() : Array
      {
         return ["Модератор","Окончание через","Тип бана"];
      }
      
      override protected function get comboList() : Array
      {
         var _loc1_:DataProvider = new DataProvider();
         var _loc2_:int = 0;
         while(_loc2_ < §_-jb§.§_-JY§.length)
         {
            _loc1_.addItem({
               "label":§_-jb§.§_-JY§[_loc2_]["title"],
               "value":_loc2_
            });
            _loc2_++;
         }
         return [["Причина",_loc1_]];
      }
      
      override protected function get checkList() : Array
      {
         return ["Повторное нарушение"];
      }
   }
}

