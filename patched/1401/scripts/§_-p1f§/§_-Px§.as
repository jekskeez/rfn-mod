package §_-p1f§
{
   import fl.data.DataProvider;
   import flash.utils.Endian;
   import protocol.§_-U1M§;
   import utils.§_-d1C§;
   import utils.§_-ex§;
   
   public class §_-Px§ extends §_-6Y§
   {
      
      public static const §_-V1U§:Array = ["Нет","Кляп","Бан","Пермач"];
      
      private var reason:int = 0;
      
      private var §_-Zd§:Boolean = false;
      
      private var §_-736§:int = 0;
      
      private var time:int = 0;
      
      public function §_-Px§()
      {
         super(§_-6Y§.§_-N29§);
      }
      
      override protected function init() : void
      {
         super.init();
         this.§_-53o§[1].selectable = false;
         this.§_-53o§[1].mouseEnabled = false;
         this.§_-53o§[2].selectable = false;
         this.§_-53o§[2].mouseEnabled = false;
      }
      
      override public function load(param1:*) : void
      {
         var _loc2_:int = int(param1[0]);
         this.§_-Zd§ = false;
         this.reason = int(param1[1]);
         this.§_-736§ = int(param1[2]);
         this.time = int(param1[3]);
         this.§_-53o§[0].text = this.§_-736§.toString();
         this.§_-53o§[1].text = §_-ex§.§_-d2X§(this.time);
         this.§_-53o§[2].text = §_-V1U§[_loc2_];
         this.§_-MO§[0].selected = this.§_-Zd§;
         this.§_-UK§[0].§_-Uf§ = this.reason;
      }
      
      override public function save() : §_-U1M§
      {
         this.§_-Zd§ = this.§_-MO§[0].selected;
         this.reason = int(this.§_-UK§[0].§_-l1§["value"]);
         this.§_-736§ = int(this.§_-53o§[0].text);
         var _loc1_:§_-U1M§ = new §_-U1M§();
         _loc1_.endian = Endian.LITTLE_ENDIAN;
         _loc1_.writeByte(this.reason);
         _loc1_.writeByte(this.§_-Zd§ ? 1 : 0);
         if(this.§_-53o§[0].text.length > 0)
         {
            _loc1_.§_-s15§(this.§_-736§);
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
         while(_loc2_ < §_-d1C§.§_-ZN§.length)
         {
            _loc1_.addItem({
               "label":§_-d1C§.§_-ZN§[_loc2_]["title"],
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

