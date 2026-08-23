package §_-l2u§
{
   import protocol.§_-Q17§;
   import utils.StringUtil;
   
   public class §_-Kb§
   {
      
      public var number:int;
      
      public var location:int;
      
      public var §_-W22§:int;
      
      public var mode:int;
      
      public var §_-I1a§:int;
      
      public var map:String;
      
      public var time:int;
      
      public var §_-l2F§:int;
      
      public var §_-U27§:int;
      
      public var §_-p1h§:int;
      
      public var §_-y1C§:int;
      
      public var §_-I1I§:int;
      
      public function §_-Kb§()
      {
         super();
         this.reset();
      }
      
      public function reset() : void
      {
         this.number = -1;
         this.mode = 0;
         this.§_-I1a§ = -1;
         this.map = "";
         this.time = 0;
      }
      
      public function §_-93W§(param1:§_-Kb§) : Boolean
      {
         return this.number == param1.number && this.location == param1.location && this.§_-W22§ == param1.§_-W22§ && this.mode == param1.mode && this.map == param1.map && this.time == param1.time;
      }
      
      public function copy(param1:§_-Kb§) : void
      {
         this.location = param1.location;
         this.§_-W22§ = param1.§_-W22§;
         this.mode = param1.mode;
         this.map = param1.map;
         this.time = param1.time;
         this.number = param1.number;
      }
      
      public function load(param1:Array) : void
      {
         this.mode = param1[0];
         this.§_-I1a§ = param1[1];
         this.time = param1[2];
         this.map = StringUtil.§_-a14§(param1[3]);
         this.§_-l2F§ = param1[4];
         this.§_-U27§ = param1[5];
         this.§_-p1h§ = param1[6];
         this.§_-y1C§ = param1[7];
         this.§_-I1I§ = param1[8];
         §_-Q17§.add(param1[3]);
      }
   }
}

